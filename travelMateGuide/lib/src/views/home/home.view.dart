import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:travelMateGuide/src/views/postView/post.view.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
        )
      ),
      padding: EdgeInsets.all(10),
      child: Column(
    children: [
      Padding(
        padding:
            const EdgeInsets.only(top: 40, bottom: 20, left: 5, right: 5),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.0),
              color: Colors.white),
          child: TextField(
            decoration: InputDecoration(
              hintText: "Search",
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              prefixIcon: Icon(
                Icons.search,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
      Expanded(
        child: ListView.builder(
            physics: BouncingScrollPhysics(), // test this
            itemExtent: 200.0,
            itemCount: 20,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PostView()),
                  );
                },
                child: Padding(
                  padding:
                      const EdgeInsets.only(top: 15, left: 5, right: 5),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset:
                              Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Row(
                            children: [
                              CircularProfileAvatar(
                                null,
                                child: Image(
                                  image: AssetImage('images/user.png'),
                                  fit: BoxFit.cover,
                                ),
                                borderColor: Colors.white,
                                borderWidth: 1,
                                elevation: 2,
                                radius: 30,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(child: Text('Tharindu'))
                            ],
                          ),
                        ),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(15),
                                  bottomRight: Radius.circular(15)),
                              image: DecorationImage(
                                  image: AssetImage('images/bg.jpg'),
                                  fit: BoxFit.cover),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            }),
      )
    ],
      ),
    );
  }
}
