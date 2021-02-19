import 'package:flutter/material.dart';

import '../../constants.dart';

class SecretCodeScreen extends StatefulWidget {
  @override
  _SecretCodeScreenState createState() => _SecretCodeScreenState();
}

class _SecretCodeScreenState extends State<SecretCodeScreen> {
  final _formKey = GlobalKey<FormState>();

  String _secretCode = '';
  bool _showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.5,
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
                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(height: 50),
                  _buildImage(),
                  _buildLogo(),
                  SizedBox(height: 80),
                  _buildSecretCodeForm(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _saveFormVariables() {
    _formKey.currentState.save();
    _formKey.currentState.reset();
    setState(() {
      _secretCode = '';
    });
  }

  void _saveForm(String value) {
    _secretCode = value;
    // Add validation with firebase
  }

  Widget _buildLogo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
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

  Widget _buildImage() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 70),
          child: Text(
            'IMAGE',
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

  Widget _buildForgetPasswordButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        FlatButton(
          onPressed: () {
            // Forgot password function...
          },
          child: Text("Forgot Password?"),
        ),
      ],
    );
  }

  Widget _buildConfirmButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
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
            onPressed: _saveFormVariables,
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
                  decoration: InputDecoration(
                    border:
                        OutlineInputBorder(borderSide: BorderSide(width: 1)),
                    labelText: 'Your Secret Code',
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          _showPassword = !_showPassword;
                        });
                      },
                      child: Icon(_showPassword
                          ? Icons.visibility
                          : Icons.visibility_off),
                    ),
                  ),
                  obscureText: !_showPassword,
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.visiblePassword,
                  // validator: (value) {
                  //   if (value.isEmpty) {
                  //     return 'Please enter your secret code.';
                  //   }
                  //   return null;
                  // },
                  onFieldSubmitted: (_) {
                    _saveFormVariables();
                  },
                  onSaved: (value) {
                    _saveForm(value);
                  },
                  onChanged: (value) {
                    setState(() {
                      _secretCode = value;
                    });
                  },
                ),
                _buildForgetPasswordButton(),
              ],
            ),
          ),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.075),
        GestureDetector(
          child: _buildConfirmButton(),
          onTap: _secretCode != '' ? _saveFormVariables : null,
          // Add navigation to next step...
        ),
      ],
    );
  }
}
