import 'package:flutter/material.dart';
import 'package:travelMateGuide/src/views/booking/booking.view.dart';
import 'package:travelMateGuide/src/views/home/home.view.dart';
import 'package:travelMateGuide/src/views/postCreate/postCreate.view.dart';
import 'package:travelMateGuide/src/views/widgets/navigationBar.widget.dart';
import 'package:travelMateGuide/src/widget/logged.in.widget.dart';

class NavigationBar extends StatefulWidget {
  @override
  _NavigationBarState createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar> {
  
  int index = 0;
  List<Widget> widgetOption = <Widget>[
    Home(),
    Booking(),
    PostCreate(),
    // Profile()
    LoggedInWidget()
  ];

  void changeIndexNumber(value) {
    setState(() {
      index = value;
    });
  }

  @override
  Widget build(BuildContext context) {
   return Scaffold(
      body: widgetOption.elementAt(index),
      bottomNavigationBar: navigationBar(index: index, action: changeIndexNumber),
    );
  }
}