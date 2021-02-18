import 'package:flutter/material.dart';

class SecretCodeForm extends StatefulWidget {
  @override
  _SecretCodeFormState createState() => _SecretCodeFormState();
}

class _SecretCodeFormState extends State<SecretCodeForm> {
  final _formKey = GlobalKey<FormState>();

  String _secretCode = '';
  bool _showPassword = false;

  void _saveFormVariables() {
    _formKey.currentState.save();
    _formKey.currentState.reset();
    setState(() {
      _secretCode = '';
    });
  }

  void _saveForm(String value) {
    _secretCode = value;
    print(_secretCode);
  }

  @override
  Widget build(BuildContext context) {
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
                  // Add input validation...
                ),
                SizedBox(height: 10),
                Text('forgot secret code?'),
              ],
            ),
          ),
        ),
        SizedBox(height: 130),
        RaisedButton(
          onPressed: _secretCode != '' ? _saveFormVariables : null,
          child: Text('Confirm'),
          color: Theme.of(context).primaryColor,
          textColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
          ),
        ),
      ],
    );
  }
}
