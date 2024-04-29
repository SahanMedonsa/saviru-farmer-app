import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GetfarmerDetails extends StatelessWidget {
  final String documentId;

  const GetfarmerDetails({required this.documentId});

  @override
  Widget build(BuildContext context) {
    // Get the reference to the Firestore collection
    CollectionReference farmers =
        FirebaseFirestore.instance.collection('farmer');

    return FutureBuilder<DocumentSnapshot>(
      future: farmers.doc(documentId).get(), // Retrieve specific document by ID
      builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }

        if (!snapshot.hasData || snapshot.data == null) {
          return Center(child: Text('No data found'));
        }

        // Extract document data
        Map<String, dynamic> data =
            snapshot.data!.data() as Map<String, dynamic>;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('First Name: ${data['firstname']}'),
            Text('Last Name: ${data['lastname']}'),
            Text('Username: ${data['username']}'),
            Text('Age: ${data['age']}'),
            Text('District: ${data['district']}'),
            Text('Address: ${data['address']}'),
            Text('NIC: ${data['nic']}'),
            Text('Email: ${data['email']}'),
            Text('Phone Number: ${data['phonenum']}'),
            // Display other details as needed
          ],
        );
      },
    );
  }
}
