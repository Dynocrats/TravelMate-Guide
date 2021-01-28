import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double screenWidthAdjustment;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    screenWidthAdjustment = MediaQuery.of(context).size.width - 48.0 - 64.0;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      decoration: BoxDecoration(color: Colors.amberAccent),
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(top: 40, bottom: 20, left: 5, right: 5),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  color: Colors.green),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search",
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  prefixIcon: Icon(Icons.search),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemExtent: 150.0,
                itemCount: 20,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 120,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                            image: AssetImage('assets/2.jpg'),
                            fit: BoxFit.cover
                          ),
                        ),
                        child: Stack(
                          children: [
                            Positioned(
                              top: 20.0,
                              left: 100.0,
                              width: screenWidthAdjustment,
                              child: Material(
                                color: Colors.transparent,
                                child: Text(
                                  'Tharindu Kavishna',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                  maxLines: 3,
                                ),
                              ),
                            ),
                            Positioned(
                              top: 18.0,
                              left: 15.0,
                              child: CircularProfileAvatar(
                                null,
                                child: Image(image: AssetImage('assets/3.png')),
                                borderColor: Colors.white,
                                borderWidth: 1,
                                elevation: 2,
                                radius: 30,
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
    ));
  }
}
