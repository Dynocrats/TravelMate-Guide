import 'package:flutter/material.dart';
import 'package:paginate_firestore/paginate_firestore.dart';
import 'package:travelMateGuide/src/service/booking.service.dart';

class Booking extends StatefulWidget {
  @override
  _BookingState createState() => _BookingState();
}

class _BookingState extends State<Booking> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Colors.blue,
              Colors.green,
            ],
      )),
      child: PaginateFirestore(
          physics: BouncingScrollPhysics(),
          query: AllBooking().allBooking(),
          itemBuilderType: PaginateBuilderType.listView,
          itemBuilder: (index, BuildContext context, documentSnapshot) {
            return GestureDetector(
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 8, right: 12, bottom: 8, left: 12),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.lightBlue[100],
                      borderRadius: BorderRadius.circular(15.0)),
                  child: Row(
                    children: [
                      Container(
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15.0),
                            bottomLeft: Radius.circular(15.0)
                          ),
                          color: Colors.red
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SizedBox(height: 10.0,),
                            Expanded(child: Text('27', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30),)),
                            Expanded(child: Text('April', style: TextStyle(color: Colors.white, fontWeight: FontWeight.normal, fontSize: 20),)),
                            Expanded(child: Text('2021', style: TextStyle(color: Colors.white, fontWeight: FontWeight.normal, fontSize: 15),))
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              child: Column(
                                children: [
                                  SizedBox(height: 10,),
                                  Text('Tharindu Kavishna', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),),
                                  Text('2021-04-21 - 2021-05-06', style: TextStyle(color: Colors.black, fontWeight: FontWeight.normal, fontSize: 10),),
                                  SizedBox(height: 5,),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                              child: Text('Learning is the process of acquiring new understanding, knowledge, behaviors, skills, values, attitudes, and preferences.', textAlign: TextAlign.center, style: TextStyle(fontSize: 12),),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
