import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/items_model.dart';// Import the model you just created

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<Item>> fetchItems() async {
    try {
      QuerySnapshot snapshot = await _firestore.collection('items_list').get();
      return snapshot.docs.map((doc) {
        return Item.fromMap(doc.data() as Map<String, dynamic>);
      }).toList();
    } catch (e) {
      print('Error fetching items: $e');
      return [];
    }
  }
}
