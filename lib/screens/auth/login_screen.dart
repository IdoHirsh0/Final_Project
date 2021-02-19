import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../providers/auth/google_auth.dart';

import '../../screens/home_screen.dart';

import '../../constants.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/login-screen';

  final String secretCode;

  LoginScreen({@required this.secretCode});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginScreen> {
  String _email, _password;
  User _user;

  void googleSignIn() async {
    print('Sign in google');
    final user =
        await Provider.of<Auth>(context, listen: false).signInWithGoogle();
    if (user == null) {
      return;
    }
    _user = user;
    // Goes to the next screen
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => HomeScreen(),
      ),
      (Route<dynamic> route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: secoderyColor,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.6,
              width: MediaQuery.of(context).size.width,
              child: Container(
                decoration: BoxDecoration(
                  color: mainColor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: const Radius.circular(70),
                    bottomRight: const Radius.circular(70),
                  ),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildLogo(),
                _buildContainer(),
                _buildSignUpBtn(),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildLogo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 70),
          child: Text(
            'APP NAME',
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.height / 25,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }

  Widget _buildContainer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.6,
            width: MediaQuery.of(context).size.width * 0.8,
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Login",
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height / 30,
                      ),
                    ),
                  ],
                ),
                _buildEmailRow(),
                _buildPasswordRow(),
                _buildForgetPasswordButton(),
                _buildLoginButton(),
                _buildORRow(),
                _buildGoogleBtn(),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildEmailRow() {
    return Padding(
      padding: EdgeInsets.all(8),
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        onChanged: (value) {
          setState(() {
            _email = value;
          });
        },
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.email,
            color: mainColor,
          ),
          labelText: 'E-mail',
        ),
      ),
    );
  }

  Widget _buildPasswordRow() {
    return Padding(
      padding: EdgeInsets.all(8),
      child: TextFormField(
        keyboardType: TextInputType.text,
        obscureText: true,
        // Save entered _password
        onChanged: (value) {
          setState(() {
            _password = value;
          });
        },
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.lock,
            color: mainColor,
          ),
          labelText: 'Password',
        ),
      ),
    );
  }

  Widget _buildForgetPasswordButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FlatButton(
          onPressed: () {
            // Forgot _password function...
          },
          child: Text("Forgot Password?"),
        ),
      ],
    );
  }

  Widget _buildLoginButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 1.4 * (MediaQuery.of(context).size.height / 20),
          width: 5 * (MediaQuery.of(context).size.width / 10),
          margin: EdgeInsets.only(bottom: 20),
          child: RaisedButton(
            elevation: 5.0,
            color: mainColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            onPressed: () {
              // Login button function...
            },
            child: Text(
              "Login",
              style: TextStyle(
                color: Colors.white,
                letterSpacing: 1.5,
                fontSize: MediaQuery.of(context).size.height / 40,
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _buildORRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 20),
          child: Text(
            '- OR -',
            style: TextStyle(
              fontWeight: FontWeight.w400,
            ),
          ),
        )
      ],
    );
  }

  Widget _buildGoogleBtn() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            // Google sign in
            googleSignIn();
          },
          child: Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: mainColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  offset: Offset(0, 2),
                  blurRadius: 6.0,
                )
              ],
            ),
            child: Icon(
              FontAwesomeIcons.google,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }

  Widget _buildSignUpBtn() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 40),
          child: FlatButton(
            onPressed: () {
              // Sign up function...
            },
            child: RichText(
              text: TextSpan(children: [
                TextSpan(
                  text: 'Dont have an account? ',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: MediaQuery.of(context).size.height / 40,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                TextSpan(
                  text: 'Sign Up',
                  style: TextStyle(
                    color: mainColor,
                    fontSize: MediaQuery.of(context).size.height / 40,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ]),
            ),
          ),
        ),
      ],
    );
  }
}
