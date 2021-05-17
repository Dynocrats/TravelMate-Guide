import 'package:cloud_firestore/cloud_firestore.dart';

class AllBooking{
  final FirebaseFirestore db = FirebaseFirestore.instance;
  allBooking(){
    try {
      return db.collection('booking').where('bookingType', isEqualTo: 'guider');
    } catch (e) {
      print(e.toString());
    }
  }
}