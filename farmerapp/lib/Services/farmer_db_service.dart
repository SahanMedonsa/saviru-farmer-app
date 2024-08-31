import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farmerapp/Models/FarmerDetailmodel.dart';

import 'package:firebase_auth/firebase_auth.dart';

//collection name in DataBase
const String FARMER_COLLECTION_REF = "farmer";

class FarmerDatabaseServices {
  final _firestore = FirebaseFirestore.instance;
  late final CollectionReference _faremerRef;
  String? get email => FirebaseAuth.instance.currentUser?.email;

//json  withconverter
  FarmerDatabaseServices() {
    _faremerRef = _firestore
        .collection(FARMER_COLLECTION_REF)
        .withConverter<Farmer>(
            fromFirestore: (snapshots, _) => Farmer.fromJson(snapshots.data()!),
            toFirestore: (farmer, _) => farmer.toJson());
  }

  //get todo from database
  Stream<QuerySnapshot> getfarmers() {
    return _faremerRef.where('mail', isEqualTo: email ?? '').snapshots();
  }

    Stream<QuerySnapshot> getDailyCollections(String farmerId) {
    return _faremerRef
        .doc(farmerId)
        .collection('Daily Collection')
        .snapshots();
  }

    //get fertizer bill from databas

    Stream<QuerySnapshot> getfertilizerbill(String farmerId) {
    return _faremerRef
        .doc(farmerId)
        .collection('fertilizer bill')
        .snapshots();
  }

  
}
