import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService {
  final CollectionReference _collectionRef = FirebaseFirestore.instance.collection('farmer');

   
  Future<List<Map<String, dynamic>>> getDailyCollections(String farmerId) async {
    try {
      // Access the subcollection for the specific farmer
      final querySnapshot = await _collectionRef
          .doc(farmerId)
          .collection('Daily collection')
          .get();

      return querySnapshot.docs.map((doc) {
        return doc.data() as Map<String, dynamic>;
      }).toList();
    } catch (e) {
      print("Error fetching daily collections: $e");
      return [];
    }
  }
}
