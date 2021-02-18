import 'package:flutter/material.dart';

import '../../widgets/auth/secret_code_form.dart';

class SecretCodeScreen extends StatefulWidget {
  @override
  _SecretCodeScreenState createState() => _SecretCodeScreenState();
}

class _SecretCodeScreenState extends State<SecretCodeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text('Image'), // Add Image
            Text('Welcome to "application name"'), // Add style
            SecretCodeForm(),
          ],
        ),
      ),
    );
  }
}
