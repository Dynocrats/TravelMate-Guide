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
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(top: 40, bottom: 20, left: 5, right: 5),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  color: Colors.blue),
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
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemExtent: 200.0,
                itemCount: 20,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
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
                              offset:Offset(0, 3), // changes position of shadow
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
    ));
  }
}
// Container(
//                         height: 120,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(15),
//                           image: DecorationImage(
//                             image: AssetImage('images/bg.jpg'),
//                             fit: BoxFit.cover
//                           ),
//                         ),
//                         child: Stack(
//                           children: [
//                             Positioned(
//                               top: 20.0,
//                               left: 100.0,
//                               width: screenWidthAdjustment,
//                               child: Material(
//                                 color: Colors.transparent,
//                                 child: Text(
//                                   'Sinharaja Forest Reserve',
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 22,
//                                       fontWeight: FontWeight.bold),
//                                   maxLines: 3,
//                                 ),
//                               ),
//                             ),
//                             Positioned(
//                               top: 18.0,
//                               left: 15.0,
//                               child: CircularProfileAvatar(
//                                 null,
//                                 child: Image(image: AssetImage('images/user.png'), fit: BoxFit.cover,),
//                                 borderColor: Colors.white,
//                                 borderWidth: 1,
//                                 elevation: 2,
//                                 radius: 30,
//                               ),
//                             )
//                           ],
//                         ),
//                       ),
