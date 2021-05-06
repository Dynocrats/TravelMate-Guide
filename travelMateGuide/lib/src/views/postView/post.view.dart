import 'package:flutter/material.dart';

class PostView extends StatefulWidget {
  @override
  _PostViewState createState() => _PostViewState();
}

class _PostViewState extends State<PostView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Column(
        children: [
          Container(
            height: 400.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/bg.jpg'),
                fit: BoxFit.cover
              ),
              borderRadius: BorderRadius.only(
               bottomLeft: Radius.circular(20.0),
               bottomRight: Radius.circular(20.0)
             )
            ),
            child: Stack(
              children: [
                Positioned(
                  top: 20.0,
                  left: 20.0,
                  child: IconButton(
                    icon: Icon(Icons.arrow_back_ios), 
                    onPressed: ()=> Navigator.pop(context)
                  )
                )
              ],
            ),
          ),
         Container(
           decoration: BoxDecoration(
             color: Colors.blue,
             borderRadius: BorderRadius.only(
               topLeft: Radius.circular(15.0),
               topRight: Radius.circular(15.0)
             )
           ),
           child: Text('data'),
         )
        ],
      ),
    );
  }
}

