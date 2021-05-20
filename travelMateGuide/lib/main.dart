import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travelMateGuide/src/provider/post.provider.dart';
import 'package:travelMateGuide/src/views/home.page.dart';


Future<void> main() async{
   WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp();

   var multiProvider = MultiProvider(
     providers: [
       ChangeNotifierProvider(create: (context) => PostViewBloc())
     ],
     child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    ),
    );
  runApp(multiProvider);
}



