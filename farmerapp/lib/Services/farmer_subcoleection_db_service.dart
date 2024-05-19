import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

// Collection names in the database
const String FARMER_COLLECTION_REF = "farmer";
const String SUBCOLLECTION_NAME =
    "Daily Collection"; // Replace with your subcollection name

class FarmerSubDatabaseServices {
  final _firestore = FirebaseFirestore.instance;
  late final CollectionReference _farmerRef;
  String? get FID => FirebaseAuth.instance.currentUser?.uid;
  final _auth = FirebaseAuth.instance;

  FarmerSubDatabaseServices() {
    _farmerRef = _firestore.collection(FARMER_COLLECTION_REF);
  }

  Stream<QuerySnapshot> getFarmersFromSubcollection() {
    String? email = _auth.currentUser?.email;
    return _firestore
        .collection(FARMER_COLLECTION_REF)
        .doc('ASikrj0SB1u9f6O9aNOh')
        .collection(SUBCOLLECTION_NAME)
        .snapshots();
  }
}
