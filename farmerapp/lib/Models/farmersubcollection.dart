import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farmerapp/Components/Colorpallet.dart';
import 'package:farmerapp/Components/Gtext.dart';
import 'package:farmerapp/Services/farmer_db_service.dart';
import 'package:flutter/material.dart';

class DailyCollection extends StatefulWidget {
  const DailyCollection({super.key});

  @override
  State<DailyCollection> createState() => _IncomeState();
}

final FarmerDatabaseServices _farmerDatabase = FarmerDatabaseServices();

class _IncomeState extends State<DailyCollection> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _farmerDatabase.getfarmers(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
    
        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }
    
        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return Center(child: Text('No data found'));
        }
    
        final userData = snapshot.data!.docs.first;
        String farmerId = userData.id;
    
        return StreamBuilder<QuerySnapshot>(
          stream: _farmerDatabase.getfertilizerbill(farmerId),
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> collectionSnapshot) {
            if (collectionSnapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
    
            if (collectionSnapshot.hasError) {
              return Center(child: Text('Error: ${collectionSnapshot.error}'));
            }
    
            if (!collectionSnapshot.hasData || collectionSnapshot.data!.docs.isEmpty) {
              return Center(child: Text('No fertilizer bill found'));
            }
    
            final dailyCollections = collectionSnapshot.data!.docs;
    
            // Grouping collections by date and calculating totals
            Map<String, double> dailyTotals = {};
            Map<String, List<Map<String, dynamic>>> collectionsByDate = {};
    
            for (var doc in dailyCollections) {
              var collection = doc.data() as Map<String, dynamic>;
              String date = collection['purchasedate'];
              // String date = timestamp.toDate().toString().split(' ')[0];
              
              double price = (collection['price'] as num?)?.toDouble() ?? 0.0;
double amount = (collection['amount'] as num?)?.toDouble() ?? 0.0;

              double total = price * amount;
    
              if (!collectionsByDate.containsKey(date)) {
                collectionsByDate[date] = [];
                dailyTotals[date] = 0;
              }
    
              collectionsByDate[date]!.add(collection);
              dailyTotals[date] = dailyTotals[date]! + total;
            }
    
            List<String> dates = dailyTotals.keys.toList();
    
            return ListView.builder(
              itemCount: dates.length,
              itemBuilder: (context, index) {
                String date = dates[index];
                double dailyTotal = dailyTotals[date] ?? 0;
                List<Map<String, dynamic>> details = collectionsByDate[date] ?? [];
    
                return Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Card(
                    margin: EdgeInsets.symmetric(vertical: 8.0),
                    child: ExpansionTile(
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Gtext(text: date, tsize: 16, tcolor: Colors.black, fweight: FontWeight.bold),
                          Gtext(text: 'Total: Rs.${dailyTotal.toStringAsFixed(2)}', tsize: 16, tcolor: Colors.black, fweight: FontWeight.bold),
                        ],
                      ),
                      children: details.map((collection) {
                        return ListTile(
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Gtext(text: '${collection['type']} - ${collection['amount']} kg', tsize: 14, tcolor: Colors.black, fweight: FontWeight.normal),
                              Gtext(text: 'Price: Rs.${collection['price']}', tsize: 14, tcolor: Colors.black, fweight: FontWeight.normal),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}
