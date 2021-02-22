import 'package:flutter/material.dart';

import '../../constants.dart';

import '../../screens/auth/login_screen.dart';

class SecretCodeScreen extends StatefulWidget {
  static const routeName = '/secret-code-screen';

  @override
  _SecretCodeScreenState createState() => _SecretCodeScreenState();
}

class _SecretCodeScreenState extends State<SecretCodeScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _showPassword = false;
  String _secretCode;

  bool _firebaseValidation() {
    // Add firebase validation to check users secret code.
  }

  void _saveForm() {
    final isLocalValid = _formKey.currentState.validate();
    if (!isLocalValid) {
      return;
    }
    _formKey.currentState.save();
    // Goes to the next screen
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => LoginScreen(secretCode: _secretCode),
      ),
      (Route<dynamic> route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildImage(),
                  _buildLogo(),
                  _buildSecretCodeForm(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImage() {
    return Column(
      children: [
        SizedBox(height: 50),
        Container(
          height: 250,
          width: 300,
          child: Placeholder(),
        ),
      ],
    );
  }

  Widget _buildLogo() {
    return Column(
      children: [
        Row(
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
        ),
      ],
    );
  }

  Widget _buildSecretCodeForm() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  obscureText: !_showPassword,
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    border:
                        OutlineInputBorder(borderSide: BorderSide(width: 1)),
                    labelText: 'Your Secret Code',
                    // Show text or not
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          _showPassword = !_showPassword;
                        });
                      },
                      child: Icon(
                        _showPassword ? Icons.visibility : Icons.visibility_off,
                      ),
                    ),
                  ),
                  // Validation when _saveForm() is trigred
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter your secret code.';
                    }
                    // Add firebase validation...
                    return null;
                  },
                  // When done button is trigred
                  onFieldSubmitted: (value) {
                    _secretCode = value;
                    _saveForm();
                  },
                ),
                _buildForgetPasswordButton(),
                SizedBox(height: 30),
                _buildConfirmButton(),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildForgetPasswordButton() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FlatButton(
              // On Pressed
              onPressed: () {
                // Forgot password function...
              },
              child: Text("Forgot Password?"),
            ),
          ],
        ),
        SizedBox(height: 10),
      ],
    );
  }

  Widget _buildConfirmButton() {
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
            // On pressed
            onPressed: _saveForm,
            child: Text(
              "Confirm",
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
}
