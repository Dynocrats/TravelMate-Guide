import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(color: Colors.pinkAccent),
      child: Column(
        children: [
          Container(
            height: 200,
            decoration: BoxDecoration(
                color: Colors.yellow,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50.0),
                    bottomRight: Radius.circular(50.0))),
          ),
          Container(
            height: 350,
            decoration: BoxDecoration(color: Colors.greenAccent),
          ),
          Expanded(
            child: Container(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                physics: BouncingScrollPhysics(),
                itemBuilder: (BuildContext context, int index){
                  return Container(
                    margin: EdgeInsets.only(top: 10.0, bottom: 10.0, right: 8.0, left: 8.0),
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.yellow,
                      borderRadius: BorderRadius.circular(20.0)
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
