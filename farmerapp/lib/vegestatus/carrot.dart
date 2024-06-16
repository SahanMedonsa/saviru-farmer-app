import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farmerapp/Components/vegestatuscontainer.dart';
import 'package:flutter/material.dart';

class carrotStatus extends StatelessWidget {
  final CollectionReference vegestatus =
      FirebaseFirestore.instance.collection('vegestatus');

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot>(
      future: vegestatus.doc('Carrot').get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }

        if (!snapshot.hasData || !snapshot.data!.exists) {
          return Center(child: Text('Document does not exist'));
        }

        Map<String, dynamic> data =
            snapshot.data!.data() as Map<String, dynamic>;
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StatusContainer(
                vege: "Carrot",
                yesterdayprice: "${data['yesterdayprice']}",
                imagePath: "assets/carrot.jpeg",
                todayprice: "${data['todayprice']}"),
          ],
        );
      },
    );
  }
}
