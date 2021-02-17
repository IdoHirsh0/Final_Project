import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../screens/home_screen.dart';
import '../../providers/auth/google_auth.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  User user;

  // Logout of google account
  // @override
  // void initState() {
  //   super.initState();
  //   signOutGoogle();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.center,
        child: googleLoginButton(),
      ),
    );
  }

  void click() {
    signInWithGoogle().then(
      (user) => {
        this.user = user,
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomeScreen(),
          ),
        ),
      },
    );
  }

  Widget googleLoginButton() {
    return OutlineButton(
      onPressed: this.click,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(45),
      ),
      splashColor: Colors.grey,
      borderSide: BorderSide(color: Colors.grey),
      child: Padding(
        padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(
              image: AssetImage('assets/google_logo.png'),
              height: 35,
            ),
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                'Sign in with Google',
                style: TextStyle(color: Colors.grey, fontSize: 25),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
