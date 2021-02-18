import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/auth/google_auth.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Sign out'),
          onPressed: Provider.of<Auth>(context, listen: false).signOutGoogle,
        ),
      ),
    );
  }
}
