import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farmerapp/Models/Vegestatusmodel.dart';

// Collection name in Firestore
const String vege_COLLECTION_REF = "vegestatus";

class VegestatusDatabaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  late final CollectionReference<VegetableStatus> _vegeRef;

  VegestatusDatabaseService() {
    _vegeRef = _firestore.collection(vege_COLLECTION_REF).withConverter<VegetableStatus>(
      fromFirestore: (snapshot, _) => VegetableStatus.fromJson(snapshot.data()!),
      toFirestore: (vege, _) => vege.toJson(),
    );
  }

  // Get vegetable status data from the database as a stream
  Stream<QuerySnapshot<VegetableStatus>> getVege() {
    return _vegeRef.orderBy('date', descending: true).snapshots();
  }

  // Get vegetable status data for a specific date as a stream
  Stream<QuerySnapshot<VegetableStatus>> getVegeByDate(DateTime date) {
    // Start and end timestamps for the given date
    Timestamp endOfDay = Timestamp.fromDate(DateTime(date.year, date.month, date.day));
    Timestamp startOfDay = Timestamp.fromDate(DateTime(date.year, date.month, date.day, 23, 59, 59));

    return _vegeRef
        .where('date', isGreaterThanOrEqualTo: endOfDay)
        .where('date', isLessThanOrEqualTo: startOfDay)
        .snapshots();
  }
}
