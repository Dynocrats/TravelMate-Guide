import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:paginate_firestore/paginate_firestore.dart';
import 'package:provider/provider.dart';
import 'package:travelMateGuide/src/provider/google.signin.dart';
import 'package:travelMateGuide/src/provider/post.provider.dart';
import 'package:travelMateGuide/src/service/user.posts.dart';
import 'package:travelMateGuide/src/views/postView/post.view.dart';
import 'package:travelMateGuide/src/views/profile/edit.profile.view.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    final userId = FirebaseAuth.instance.currentUser;
    final PostViewBloc postViewBloc = Provider.of<PostViewBloc>(context);

    return FutureBuilder<DocumentSnapshot>(
        future: users.doc(userId.uid).get(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text("Something went wrong");
          }

          if (snapshot.hasData && !snapshot.data.exists) {
            return Text("Document does not exist");
          }
          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data = snapshot.data.data();
            return Container(
              height: MediaQuery.of(context).size.height,
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
                  // App bar
                  Container(
                    height: 80.0,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(color: Colors.black),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                            child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ProfileUpdate()),
                            );
                          },
                          child: Container(
                              margin: EdgeInsets.only(top: 40.0, left: 20.0),
                              child: Text(
                                'EDIT',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              )),
                        )),
                        Expanded(
                            child: Container(
                          margin: EdgeInsets.only(top: 42.0),
                          child: Text(
                            data['userName'] ?? 'USER NAME',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                        )),
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(top: 25.0, left: 60.0),
                            child: IconButton(
                                icon: Icon(
                                  Icons.logout,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  final provider = Provider.of<GoogleSignInProvider>(context,listen: false);
                                  AwesomeDialog(
                                      context: context,
                                      dialogType: DialogType.WARNING,
                                      headerAnimationLoop: false,
                                      animType: AnimType.TOPSLIDE,
                                      dismissOnTouchOutside: false,
                                      showCloseIcon: true,
                                      closeIcon:
                                          Icon(Icons.close_fullscreen_outlined),
                                      title: 'LogOut',
                                      desc: 'Do you really want an logout!',
                                      btnCancelOnPress: () {
                                        print('Cancel');
                                      },
                                      btnOkOnPress: () {
                                        provider.logout();
                                      })
                                    ..show();
                                }),
                          ),
                        )
                      ],
                    ),
                  ),

                  // Top Details
                  Container(
                    height: 160,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomRight,
                        colors: [
                          Colors.blue,
                          Colors.green,
                        ],
                      ),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(50.0),
                        bottomRight: Radius.circular(50.0),
                      ),
                    ),
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 20.0),
                          child: CircularProfileAvatar(
                            null,
                            child: Image(
                              image: NetworkImage(data['userImageUrl']),
                              fit: BoxFit.cover,
                            ),
                            borderColor: Colors.white,
                            borderWidth: 1,
                            elevation: 2,
                            radius: 60,
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(top: 30.0, left: 20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  data['userName'] ?? 'Tharindu Kavishna',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 25.0,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  data['userEmail'] ??
                                      'tharindukavishna@gmail.com',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15.0),
                                ),
                                Text(
                                  data['guiderContact'] ?? '000 00 00 000',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15.0),
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'RATE',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      width: 20.0,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.yellow,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.yellow,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.yellow,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.yellow,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.yellow,
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),

                  // Profile Other Details
                  Container(
                    margin: EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'About',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          data['guiderAbout'] ??
                              'dfjdfkjnlk dlfkjdlhkd ejhrk edrhjolkj d joldk kijlk  peorij edroijo edorijhed',
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          'Language',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(data['guiderLanguages'] ?? 'Sinhala | English',
                            style: TextStyle(color: Colors.white)),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          'User Post',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),

                  // User Post List
                  Container(
                    height: 150.0,
                    margin: EdgeInsets.only(left: 10.0),
                    child: PaginateFirestore(
                      scrollDirection: Axis.horizontal,
                      query: UserPosts().userPosts(),
                      itemBuilderType: PaginateBuilderType.listView,
                      physics: BouncingScrollPhysics(),
                      itemBuilder:
                          (index, BuildContext context, documentSnapshot) {
                        return GestureDetector(
                          onTap: () {
                            postViewBloc.changePostViewBloc(
                              guiderPlaceName:
                                  documentSnapshot.data()['guiderTitle'],
                              guiderPlaceImageUrl:
                                  documentSnapshot.data()['guiderImageUrl'],
                              guiderLocation:
                                  documentSnapshot.data()['guiderLocation'],
                              guiderDesc: documentSnapshot.data()['guiderDesc'],
                              guiderPrice:
                                  documentSnapshot.data()['guiderPrice'],
                            );
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PostView()),
                            );
                          },
                          child: Container(
                            margin: EdgeInsets.only(
                                top: 10.0, bottom: 10.0, right: 8.0, left: 8.0),
                            width: 116,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20.0)),
                            child: Column(
                              children: [
                                Container(
                                  height: 100.0,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(20.0),
                                          topRight: Radius.circular(20.0)),
                                      image: DecorationImage(
                                          image: NetworkImage(
                                            documentSnapshot
                                                .data()['guiderImageUrl'],
                                          ),
                                          fit: BoxFit.cover)),
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(20.0),
                                          bottomRight: Radius.circular(20.0)),
                                    ),
                                    child: Text(
                                      documentSnapshot.data()['guiderTitle'],
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
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
            );
          }
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
              child: Center(child: Text("loading")));
        });
  }
}
