import 'package:farmerapplication/Models/FarmerDetailmodel.dart';
import 'package:farmerapplication/Services/farmer_db_service.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FarmerPersonalDetails extends StatefulWidget {
  const FarmerPersonalDetails({Key? key}) : super(key: key);

  @override
  State<FarmerPersonalDetails> createState() => _FarmerPersonalDetailsState();
}

class _FarmerPersonalDetailsState extends State<FarmerPersonalDetails> {
  final currentUser = FirebaseAuth.instance.currentUser;

  final FarmerDatabaseServices _farmerDatabaseServices =
      FarmerDatabaseServices();

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.green.withOpacity(0.2),
        padding: const EdgeInsets.all(15.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            'Personal Details',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
          ),
          SizedBox(height: 15),
          SizedBox(
            height: 500,
            child: StreamBuilder(
                stream: _farmerDatabaseServices.getfarmers(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  List farmers = snapshot.data?.docs ?? [currentUser!.uid];

                  if (farmers.isEmpty) {
                    return const Center(child: Text('Add Farmers'));
                  }
                  return ListView.builder(
                    itemCount: 1,
                    itemBuilder: (context, index) {
                      Farmer farmer = farmers[index].data();
                      String farmerId = farmers[index].id;

                      return Expanded(
                        child: Card(
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text('Name : '),
                                  Text(farmer.firstname),
                                ],
                              ),
                              Row(
                                children: [
                                  Text('Address : '),
                                  Text(farmer.address),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }),
          )
        ]));
  }
}
