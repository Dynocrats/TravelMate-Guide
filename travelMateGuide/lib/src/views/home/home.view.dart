import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:paginate_firestore/paginate_firestore.dart';
import 'package:travelMateGuide/src/service/all.posts.service.dart';
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
      )),
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          
          Padding(
            padding:  EdgeInsets.only(top: 40.0, bottom: 20.0, left: 5.0, right: 5.0),
            child: Container(
              // padding: EdgeInsets.only(top: 40, bottom: 20, left: 5, right: 5),
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
            child: PaginateFirestore(
                physics: BouncingScrollPhysics(),
                query: AllPosts().allPosts(),
                itemBuilderType: PaginateBuilderType.listView,
                itemBuilder: (index, BuildContext context, documentSnapshot) {

                  return  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PostView()),
                      );
                    },
                    child: Padding(
                     padding: EdgeInsets.only(top: 15, left: 5, right: 5),
                      child: Container(
                        height: 250.0,
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
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  CircularProfileAvatar(
                                    null,
                                    child: Image(
                                      image: NetworkImage(documentSnapshot.data()['userImageUrl']),
                                      fit: BoxFit.cover,
                                    ),
                                    borderColor: Colors.grey,
                                    borderWidth: 2,
                                    elevation: 2,
                                    radius: 30,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(child: Text(documentSnapshot.data()['guiderTitle'], style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20.0),))
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
                                      image: NetworkImage(documentSnapshot.data()['guiderImageUrl']),
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
