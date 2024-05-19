import 'package:farmerapp/Services/farmer_db_service.dart';
import 'package:farmerapp/Tab%20view/detailstext.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FarmerPersonalDetails extends StatefulWidget {
  const FarmerPersonalDetails({Key? key}) : super(key: key);

  @override
  State<FarmerPersonalDetails> createState() => _FarmerPersonalDetailsState();
}

class _FarmerPersonalDetailsState extends State<FarmerPersonalDetails> {
  final _farmerDatabase = FarmerDatabaseServices();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green.withOpacity(0.2),
      padding: const EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Personal Details',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
          ),
          SizedBox(height: 15),
          SizedBox(
            height: 500,
            child: StreamBuilder<QuerySnapshot>(
              stream: _farmerDatabase.getfarmers(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }

                if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                }

                if (snapshot.data == null || snapshot.data!.docs.isEmpty) {
                  return Center(child: Text('No data found'));
                }

                // Accessing document fields
                final userData = snapshot.data!.docs.first;
                String firstname = userData['firstname'] ?? '';
                String lastname = userData['lastname'] ?? '';
                String username = userData['username'] ?? '';
                int age = userData['age'] ?? 0;
                String district = userData['district'] ?? '';
                String address = userData['address'] ?? '';
                String nic = userData['nic'] ?? '';
                String email = userData['mail'] ?? '';
                int phonenum = userData['phonenum'] ?? 0;
                String password = userData['passsword'] ?? '';

                String vegetable = userData['vegetable'] ?? '';
                int garea = userData['garea'] ?? 0;
                int honetime = userData['harvestOneTime'] ?? 0;
                String season = userData['season'] ?? '';
                int price1kg = userData['priceP1kg'] ?? 0;
                int profit1kg = userData['profite1kg'] ?? 0;

                return Padding(
                  padding: EdgeInsets.all(16.0),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        detailtext(
                            detail: 'Name',
                            db_datil: firstname + " " + lastname),
                        detailtext(detail: 'User Name', db_datil: username),
                        detailtext(detail: 'Age', db_datil: age.toString()),
                        detailtext(detail: 'District', db_datil: district),
                        detailtext(detail: 'Address', db_datil: address),
                        detailtext(detail: 'NIC', db_datil: nic),
                        detailtext(detail: 'Email', db_datil: email),
                        detailtext(
                            detail: 'Phone Number',
                            db_datil: phonenum.toString()),
                        detailtext(detail: 'Password', db_datil: password),
                        detailtext(detail: 'Vegetable', db_datil: vegetable),
                        detailtext(
                            detail: 'Growing Area (sqm)',
                            db_datil: garea.toString()),
                        detailtext(
                            detail: 'Harvest Time (days)',
                            db_datil: honetime.toString()),
                        detailtext(detail: 'Season', db_datil: season),
                        detailtext(
                            detail: 'Price Per Kg',
                            db_datil: price1kg.toString()),
                        detailtext(
                            detail: 'Profit Per Kg',
                            db_datil: profit1kg.toString())
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
