import 'dart:io';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:travelMateGuide/src/views/widgets/custom.btn.dart';

class ProfileUpdate extends StatefulWidget {
  @override
  _ProfileUpdateState createState() => _ProfileUpdateState();
}

class _ProfileUpdateState extends State<ProfileUpdate> {
  String guideName,
      guideEmail,
      guideProfileImageUrl,
      guideContactNumber,
      guiderAbout,
      guideLocation,
      guideLanguage;
  final user = FirebaseAuth.instance.currentUser;
  final formKey = GlobalKey<FormState>();
  final FirebaseStorage storage =
      FirebaseStorage(storageBucket: 'gs://travelmate-620f4.appspot.com');
  StorageUploadTask uploadTask;
  PickedFile imageFile;
  String fileName;
  final ImagePicker picker = ImagePicker();
  final db = FirebaseFirestore.instance;

  // Loading State
  bool updateProfile = false;

  // Select Image gallery or camera
  selectImage(ImageSource source) async {
    final pickedFile = await picker.getImage(source: source);
    setState(() {
      imageFile = pickedFile;
    });
  }

  // upload Image Firestore
  uploadImageFirestore() async {
    String filePath = 'hotels/${DateTime.now()}.jpg';
    setState(() {
      uploadTask = storage.ref().child(filePath).putFile(File(imageFile.path));
      fileName = filePath;
    });
    var url = await (await uploadTask.onComplete).ref.getDownloadURL();
    setState(() {
      guideProfileImageUrl = url.toString();
    });
  }

  // Update Data in Firestorage
  void updateUser() async {
    await db
        .collection('users')
        .doc(user.uid)
        .update({
          'userName': guideName,
          'userEmail': guideEmail,
          'userImageUrl': guideProfileImageUrl,
          'guiderContact': guideContactNumber,
          'guiderAbout': guiderAbout,
          'guiderLocation': guideLocation,
          'guiderLanguages': guideLanguage,
        })
        .then((value) => print("User Updated"))
        .catchError((error) => print("Failed to update user: $error"));
  }

  @override
  Widget build(BuildContext context) {
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
        child: ListView(
          children: [
            Container(
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    SizedBox(
                      height: 10.0,
                    ),
                    Container(
                      child: Text(
                        'Upload User Profile[required]',
                        style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        selectImage(ImageSource.gallery);
                      },
                      child: Container(
                        height: 150.0,
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 16),
                        decoration: imageFile == null
                            ? BoxDecoration(
                                color: Color(0xFFFD5F1FB),
                                borderRadius: BorderRadius.circular(6.0))
                            : BoxDecoration(
                                borderRadius: BorderRadius.circular(6.0),
                                image: DecorationImage(
                                    image: FileImage(File(imageFile.path)),
                                    fit: BoxFit.cover),
                              ),
                        child: Icon(
                          Icons.add_a_photo,
                          color: Colors.black45,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      child: Text(
                        'All Field Required',
                        style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Container(
                                decoration: BoxDecoration(
                                  color: Color(0xFFFD5F1FB),
                                  borderRadius: new BorderRadius.circular(10.0),
                                ),
                                child: Padding(
                                    padding: EdgeInsets.only(
                                        left: 15, right: 15, top: 5),
                                    child: TextFormField(
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please Enter User Name';
                                        }
                                        return null;
                                      },
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        labelText: 'User Name',
                                      ),
                                      onChanged: (value) {
                                        guideName = value;
                                      },
                                    ))),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Container(
                                decoration: BoxDecoration(
                                  color: Color(0xFFFD5F1FB),
                                  borderRadius: new BorderRadius.circular(10.0),
                                ),
                                child: Padding(
                                    padding: EdgeInsets.only(
                                        left: 15, right: 15, top: 5),
                                    child: TextFormField(
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please Enter Email';
                                        }
                                        return null;
                                      },
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        labelText: 'Email',
                                      ),
                                      onChanged: (value) {
                                        guideEmail = value;
                                      },
                                    ))),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Container(
                                decoration: BoxDecoration(
                                  color: Color(0xFFFD5F1FB),
                                  borderRadius: new BorderRadius.circular(10.0),
                                ),
                                child: Padding(
                                    padding: EdgeInsets.only(
                                        left: 15, right: 15, top: 5),
                                    child: TextFormField(
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please Enter Contact Number';
                                        }
                                        return null;
                                      },
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        labelText: 'Contact Number',
                                      ),
                                      onChanged: (value) {
                                        guideContactNumber = value;
                                      },
                                    ))),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Container(
                                decoration: BoxDecoration(
                                  color: Color(0xFFFD5F1FB),
                                  borderRadius: new BorderRadius.circular(10.0),
                                ),
                                child: Padding(
                                    padding: EdgeInsets.only(
                                        left: 15, right: 15, top: 5),
                                    child: TextFormField(
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please Enter Languages';
                                        }
                                        return null;
                                      },
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        labelText: 'Languages',
                                      ),
                                      onChanged: (value) {
                                        guideLanguage = value;
                                      },
                                    ))),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Container(
                                decoration: BoxDecoration(
                                  color: Color(0xFFFD5F1FB),
                                  borderRadius: new BorderRadius.circular(10.0),
                                ),
                                child: Padding(
                                    padding: EdgeInsets.only(
                                        left: 15, right: 15, top: 5),
                                    child: TextFormField(
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please Enter Location Link';
                                        }
                                        return null;
                                      },
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        labelText: 'Location Link',
                                      ),
                                      onChanged: (value) {
                                        guideLocation = value;
                                      },
                                    ))),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Container(
                                decoration: BoxDecoration(
                                  color: Color(0xFFFD5F1FB),
                                  borderRadius: new BorderRadius.circular(10.0),
                                ),
                                child: Padding(
                                    padding: EdgeInsets.only(
                                        left: 15, right: 15, top: 5),
                                    child: TextFormField(
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please Enter About';
                                        }
                                        return null;
                                      },
                                      minLines: 1,
                                      maxLines: 10,
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        labelText: 'About',
                                      ),
                                      onChanged: (value) {
                                        guiderAbout = value;
                                      },
                                    ))),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 16),
                      child: CreateBtn(
                        text: 'Update Profile',
                        onPressed: () async {
                          if (formKey.currentState.validate()) {
                            setState(() {
                              updateProfile = true;
                            });
                            await uploadImageFirestore();
                            updateUser();
                            setState(() {
                              updateProfile = false;
                            });
                            AwesomeDialog(
                                context: context,
                                animType: AnimType.BOTTOMSLIDE,
                                headerAnimationLoop: false,
                                dialogType: DialogType.SUCCES,
                                title: 'Succes',
                                desc: 'your prifile update succefuly!',
                                dismissOnTouchOutside: false,
                                btnOkOnPress: () {
                                  debugPrint('OnClcik');
                                  Navigator.pop(context);
                                },
                                btnOkIcon: Icons.check_circle,
                                onDissmissCallback: () {
                                  debugPrint('Dialog Dissmiss from callback');
                                })
                              ..show();
                          }
                          print('Upload Profile');
                        },
                        isLoading: updateProfile,
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
