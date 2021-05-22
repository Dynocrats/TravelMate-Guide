import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserPosts{
  final FirebaseFirestore db = FirebaseFirestore.instance;
  final user = FirebaseAuth.instance.currentUser;
  userPosts() {
    try {
      return db.collection('posts').where('userType', isEqualTo: 'guider').where('uid', isEqualTo: user.uid);
    } catch (e) {
      print(e.toString());
    }
  }
}