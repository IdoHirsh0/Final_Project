import 'package:flutter/material.dart';

import '../../widgets/auth/google_login_button.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GoogleLoginButton(),
      ),
    );
  }
}
