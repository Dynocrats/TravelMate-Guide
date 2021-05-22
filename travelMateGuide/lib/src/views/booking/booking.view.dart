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
    return Scaffold(
      appBar: AppBar(
        title: Text('Booking Details'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Container(
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
                      top: 16, right: 12, left: 12),
                  child: Container(
                    height: 140.0,
                    decoration: BoxDecoration(
                        color: Colors.lightBlue[100],
                        borderRadius: BorderRadius.circular(15.0)),
                    child: Row(
                      children: [
                        Container(
                          width: 100,
                          height: 140.0,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(documentSnapshot.data()['userUrl']),
                                fit: BoxFit.cover
                            ),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15.0),
                                bottomLeft: Radius.circular(15.0)),
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      documentSnapshot.data()['userName'],
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                    Text(
                                      '${documentSnapshot.data()['start-date']} - ${documentSnapshot.data()['end-date']}',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.normal,
                                          fontSize: 10),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10),
                                child: Text(
                                  documentSnapshot.data()['Desc'],
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(fontSize: 12),
                                ),
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
      ),
    );
  }
}
