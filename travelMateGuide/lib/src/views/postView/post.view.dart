import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travelMateGuide/src/provider/post.provider.dart';

class PostView extends StatefulWidget {
  @override
  _PostViewState createState() => _PostViewState();
}

class _PostViewState extends State<PostView> {
  @override
  Widget build(BuildContext context) {
    final PostViewBloc postViewBloc = Provider.of<PostViewBloc>(context);

    return Scaffold(
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
        child: Column(
          children: [
            Container(
              height: 400.0,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image:
                          NetworkImage(postViewBloc.getGuiderPlaceImageUrl()),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50.0),
                      bottomRight: Radius.circular(50.0))),
              child: Stack(
                children: [
                  Positioned(
                      top: 20.0,
                      left: 10.0,
                      child: IconButton(
                          icon: Icon(Icons.arrow_back_ios),
                          onPressed: () => Navigator.pop(context)))
                ],
              ),
            ),
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    Container(
                      child: Row(
                        children: [
                          Expanded(
                              child: Container(
                            margin: EdgeInsets.all(20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  postViewBloc.getGuiderPlaceName(),
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'FEATURES',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    SizedBox(
                                      width: 20.0,
                                    ),
                                    Icon(Icons.king_bed, color: Colors.white),
                                    Icon(Icons.wifi, color: Colors.white),
                                    Icon(Icons.train, color: Colors.white)
                                  ],
                                )
                              ],
                            ),
                          )),
                          Expanded(
                              child: Container(
                            child: Text(
                              'USD ${postViewBloc.getGuiderPrice()} / one day',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          )),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20.0, right: 20.0),
                      child: Text(postViewBloc.guiderDesc,
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            color: Colors.white,
                          )),
                    ),
                    Expanded(
                        child: Container(
                      margin: EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('images/map.jpg'),
                              fit: BoxFit.cover)),
                    ))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
