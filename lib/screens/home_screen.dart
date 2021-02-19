import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/auth/google_auth.dart';

import '../screens/auth/secret_code_screen.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/home-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: Center(
        child: RaisedButton(
            child: Text('Sign out'),
            onPressed: () async {
              await Provider.of<Auth>(context, listen: false).signOutGoogle();
              // Goes to the start auth screen
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => SecretCodeScreen(),
                ),
                (Route<dynamic> route) => false,
              );
            }),
      ),
    );
  }
}
