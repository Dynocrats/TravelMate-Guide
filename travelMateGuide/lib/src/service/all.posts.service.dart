import 'package:cloud_firestore/cloud_firestore.dart';

class AllPosts{
  final FirebaseFirestore db = FirebaseFirestore.instance;
  allPosts() {
    try {
      return db.collection('posts').where('userType', isEqualTo: 'guider');
    } catch (e) {
      print(e.toString());
    }
  }
}