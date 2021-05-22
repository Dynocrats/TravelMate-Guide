import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:travelMateGuide/src/provider/google.signin.dart';

class GoogleSignupButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(
        padding: EdgeInsets.all(4),
        child: OutlineButton.icon(
          label: Text(
            'Sign In With Google',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          shape: StadiumBorder(),
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          highlightedBorderColor: Colors.white,
          borderSide: BorderSide(color: Colors.white),
          textColor: Colors.white,
          icon: FaIcon(FontAwesomeIcons.google, color: Colors.red),
          onPressed: () {
            final provider = Provider.of<GoogleSignInProvider>(context, listen: false);
            provider.login();
          },
        ),
      );
}