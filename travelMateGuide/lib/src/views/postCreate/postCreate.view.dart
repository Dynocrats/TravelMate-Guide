import 'package:flutter/material.dart';

class PostCreate extends StatefulWidget {
  PostCreate({Key key}) : super(key: key);

  @override
  _PostCreateState createState() => _PostCreateState();
}

class _PostCreateState extends State<PostCreate> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text('Post Created')),
    );
  }
}