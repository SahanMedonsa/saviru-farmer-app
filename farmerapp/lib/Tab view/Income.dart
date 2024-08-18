import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farmerapp/Components/Colorpallet.dart';
import 'package:farmerapp/Components/Gtext.dart';
import 'package:farmerapp/Services/farmer_db_service.dart';
import 'package:flutter/material.dart';

class Income extends StatefulWidget {
  const Income({super.key});

  @override
  State<Income> createState() => _IncomeState();
}

final FarmerDatabaseServices _farmerDatabase = FarmerDatabaseServices();

class _IncomeState extends State<Income> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: StreamBuilder<QuerySnapshot>(
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
          final collections = snapshot.data!.docs;

          return StreamBuilder<QuerySnapshot>(
            stream: _farmerDatabase.getDailyCollections(farmerId),
            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> collectionSnapshot) {
              if (collectionSnapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }

              if (collectionSnapshot.hasError) {
                return Center(child: Text('Error: ${collectionSnapshot.error}'));
              }

              if (!collectionSnapshot.hasData || collectionSnapshot.data!.docs.isEmpty) {
                return Center(child: Text('No daily collections found'));
              }

              final dailyCollections = collectionSnapshot.data!.docs;

              // Step 1: Grouping collections by date and calculating totals
              Map<String, double> dailyTotals = {};
              Map<String, List<Map<String, dynamic>>> collectionsByDate = {};

              for (var doc in dailyCollections) {
                var collection = doc.data() as Map<String, dynamic>;
                String date = collection['CollectedDate'];
                double expectedPrice = double.parse(collection['expectedPrice'] ?? '0');
                double amount = double.parse(collection['amount'] ?? '0');
                double total = expectedPrice * amount;

                // Grouping collections by date
                if (!collectionsByDate.containsKey(date)) {
                  collectionsByDate[date] = [];
                  dailyTotals[date] = 0;
                }

                collectionsByDate[date]!.add(collection);
                dailyTotals[date] = dailyTotals[date]! + total; // Increment daily total
              }

              // Step 2: Create a list for the UI
              List<String> dates = dailyTotals.keys.toList();

              return ListView.builder(
                itemCount: dates.length,
                itemBuilder: (context, index) {
                  String date = dates[index];
                  double dailyTotal = dailyTotals[date] ?? 0;
                  List<Map<String, dynamic>> details = collectionsByDate[date] ?? [];

                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 8.0),
                    child: ExpansionTile(
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Gtext(text: date, tsize: 16, tcolor: Colors.black, fweight: FontWeight.bold),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Gtext(text: 'Daily Total: ', tsize: 12, tcolor: Colors.black, fweight: FontWeight.normal),
                                Gtext(text: 'Rs.${dailyTotal.toStringAsFixed(2)}', tsize: 16, tcolor: Colors.black, fweight: FontWeight.bold),
                            ],
                          ),
                        ],
                      ),
                      children: details.map((collection) {
                        return ListTile(
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Gtext(text: '${collection['vege']} - ${collection['amount']} kg * ${collection['expectedPrice']}', tsize: 14, tcolor: Colors.black, fweight: FontWeight.normal),
                              Gtext(text: 'Price: Rs.${(double.parse(collection['expectedPrice'] ?? '0') * double.parse(collection['amount'] ?? '0')).toStringAsFixed(2)}', tsize: 14, tcolor: Colors.black, fweight: FontWeight.normal),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
