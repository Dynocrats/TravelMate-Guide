import 'package:flutter/material.dart';
import 'package:travelMateGuide/src/views/widgets/backgroung.painter.dart';
import 'package:travelMateGuide/src/views/widgets/google.signup.button.widget.dart';

class SignUpWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Stack(
        fit: StackFit.expand,
        children: [
          buildSignUp(),
        ],
      );

  Widget buildSignUp() => Container(
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
            Spacer(),
            Container(
              alignment: Alignment.center,
              width: 275,
              child: Text(
                'TravelMate Guide',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 12),
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("images/App.png"),
                    fit: BoxFit.fill,
                  ),
                  borderRadius: BorderRadius.circular(30.0)),
              height: 200.0,
              width: 200.0,
            ),
            SizedBox(height: 50.0),
            GoogleSignupButtonWidget(),
            SizedBox(height: 12),
            Text(
              'Login to continue',
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
            Spacer(),
          ],
        ),
      );
}
