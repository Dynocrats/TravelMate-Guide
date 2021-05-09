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
         Expanded(
           child: Container(
             width: MediaQuery.of(context).size.width,
             decoration: BoxDecoration(
               color: Colors.blue,
             ),
             child: Text('data'),
           ),
         )
        ],
      ),
    );
  }
}

