import 'dart:io';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:travelMateGuide/src/views/widgets/custom.btn.dart';
class PostCreate extends StatefulWidget {

  @override
  _PostCreateState createState() => _PostCreateState();
}

class _PostCreateState extends State<PostCreate> {

  String guiderTitle, guiderDesc, guiderLocation, guiderPrice, guiderImageUrl;

  final user = FirebaseAuth.instance.currentUser;
  final formKey = GlobalKey<FormState>();
  final FirebaseStorage storage = FirebaseStorage(storageBucket: 'gs://travelmate-620f4.appspot.com');
  StorageUploadTask uploadTask;
  PickedFile imageFile;
  String fileName;
  final ImagePicker picker = ImagePicker();
  final db = FirebaseFirestore.instance;

  // Loading State
  bool createPost = false;

  // Select Image gallery or camera
  selectImage(ImageSource source) async {
    final pickedFile = await picker.getImage(source: source);
    setState(() {
      imageFile = pickedFile;
    });
  }

  // upload Image Firestore
  uploadImageFirestore() async {
    String filePath = 'posts/${DateTime.now()}.jpg';
    setState(() {
      uploadTask = storage.ref().child(filePath).putFile(File(imageFile.path));
      fileName = filePath;
    });
    var url = await (await uploadTask.onComplete).ref.getDownloadURL();
    setState(() {
      guiderImageUrl = url.toString();
    });
  }

  // Create New Post Data in Firestorage
  void createNewPost() async {
    String userImageUrl;
    await db.collection('users').where('userType', isEqualTo: 'guider').get().then((querySnapshot) {
      querySnapshot.docs.forEach((element) {
        if (element.id == user.uid) {
          userImageUrl = element.data()['userImageUrl'];
        }
      });
    });
    await db
        .collection('posts')
        .add({
          'guiderTitle': guiderTitle,
          'userImageUrl': userImageUrl,
          'guiderLocation': guiderLocation,
          'guiderPrice': guiderPrice,
          'guiderImageUrl': guiderImageUrl,
          'guiderDesc': guiderDesc,
          'userType': 'guider',
          'date': DateTime.now()
        })
        .then((value) => print("Post Created"))
        .catchError((error) => print("Failed to update user: $error"));
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  SizedBox(
                    height: 30.0,
                  ),
                  Container(
                    child: Text(
                      'Upload Image[required]',
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
                                        return 'Please Enter Title';
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      labelText: 'Title',
                                    ),
                                    onChanged: (value) {
                                      guiderTitle = value;
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
                                        return 'Please Enter Location';
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      labelText: 'Location',
                                    ),
                                    onChanged: (value) {
                                      guiderLocation = value;
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
                                        return 'Please Enter Price';
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      labelText: 'Price',
                                    ),
                                    onChanged: (value) {
                                      guiderPrice = value;
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
                                        return 'Please Enter Description';
                                      }
                                      return null;
                                    },
                                    minLines: 1,
                                    maxLines: 10,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      labelText: 'Description',
                                    ),
                                    onChanged: (value) {
                                      guiderDesc = value;
                                    },
                                  ))),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        CreateBtn(
                          text: 'Create Post',
                          onPressed: () async{
                            if(formKey.currentState.validate()){
                              setState(() {
                          createPost = true;
                        });
                        await uploadImageFirestore();
                        createNewPost();
                        setState(() {
                          createPost = false;
                        });
                        AwesomeDialog(
                            context: context,
                            animType: AnimType.BOTTOMSLIDE,
                            headerAnimationLoop: false,
                            dialogType: DialogType.SUCCES,
                            title: 'Succes',
                            desc: 'New Post Created!',
                            dismissOnTouchOutside: false,
                            btnOkOnPress: () {
                              debugPrint('OnClcik');
                              // Navigator.pop(context);
                            },
                            btnOkIcon: Icons.check_circle,
                            onDissmissCallback: () {
                              debugPrint('Dialog Dissmiss from callback');
                            })
                          ..show();
                            }
                          },
                          isLoading: createPost,
                        )
                      ],
                    ),
                  ),
                 SizedBox(height: 10.0,),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}