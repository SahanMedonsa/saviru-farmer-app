import 'package:farmerapplication/Services/farmer_subcoleection_db_service.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farmerapplication/Components/Colorpallet.dart';

class DailyCollection extends StatefulWidget {
  const DailyCollection({Key? key}) : super(key: key);

  @override
  State<DailyCollection> createState() => _DailyCollectionState();
}

class _DailyCollectionState extends State<DailyCollection> {
  final _dailyCollection = FarmerSubDatabaseServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.forest_Green.withOpacity(0.2),
      body: StreamBuilder<QuerySnapshot>(
        stream: _dailyCollection.getFarmersFromSubcollection(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          // If there's no error and data is ready, build the list of items
          return ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              // Extract data from each document in the sub-collection
              Map<String, dynamic> data =
                  document.data() as Map<String, dynamic>;

              // Customize how you display the data from the sub-collection
              return Padding(
                padding: const EdgeInsets.only(top: 10, left: 8, right: 8),
                child: ListTile(
                  tileColor: Colors.amber,
                  title: Text(data['mail']), // Example field from the document
                  subtitle: Text(data['vege']), // Another example field
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
