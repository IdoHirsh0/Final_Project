import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/auth/google_auth.dart';

class GoogleLoginButton extends StatelessWidget {
  void buttonPressed(BuildContext context) async {
    print('Sign in google');
    await Provider.of<Auth>(context, listen: false).signInWithGoogle();
  }

  @override
  Widget build(BuildContext context) {
    return OutlineButton(
      onPressed: () {
        buttonPressed(context);
      },
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
