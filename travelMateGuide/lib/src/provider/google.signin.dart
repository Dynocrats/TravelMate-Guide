import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInProvider extends ChangeNotifier {
  final googleSignIn = GoogleSignIn();

  bool _isSigningIn;

  GoogleSignInProvider() {
    _isSigningIn = false;
  }

  bool get isSigningIn => _isSigningIn;

  set isSigningIn(bool isSigningIn) {
    _isSigningIn = isSigningIn;
    notifyListeners();
  }

  Future login() async {
    isSigningIn = true;

    final user = await googleSignIn.signIn();
    if (user == null) {
      isSigningIn = false;
      return;
    } else {
      final googleAuth = await user.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await FirebaseAuth.instance.signInWithCredential(credential);
      saveLoginUser();
      isSigningIn = false;
    }
  }

  Future saveLoginUser() async {
    bool userProfile = true;
    final user = FirebaseAuth.instance.currentUser;
    final db = FirebaseFirestore.instance;
    await db.collection('users').get().then((querySnapshot) {
      querySnapshot.docs.forEach((element) {
        if (element.id == user.uid) {
          userProfile = false;
        }
      });
    });
    if (userProfile) {
      await db.collection('users').doc(user.uid).set({
        'userId': user.uid,
        'userName': user.displayName,
        'userEmail': user.email,
        'userImageUrl': user.photoURL,
        'guiderContact': null,
        'guiderAbout': null,
        'guiderLocation': null,
        'guiderLanguages': null,
        'userType': 'guider',
        'rate': 0,
        'date': DateTime.now()
      });
    }
  }

  void logout() async {
    await googleSignIn.disconnect();
    FirebaseAuth.instance.signOut();
  }
}
