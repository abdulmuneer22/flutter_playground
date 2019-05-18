import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      margin: EdgeInsets.all(20.0),
      child: Form(
        key: formKey,
        child: Column(
          children: <Widget>[
            emailField(),
            passwordField(),
            Container(
              padding: EdgeInsets.only(bottom: 20.00),
            ),
            submitButton(),
          ],
        ),
      ),
    );
  }

  Widget emailField() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: 'Email Address', hintText: 'you@example.com'),
      keyboardType: TextInputType.emailAddress,
      validator: (String value) {
        var error;
        error = null;
        if (!value.contains('@')) {
          error = 'Please enter a valid email';
        }
        return error;
      },
    );
  }

  Widget passwordField() {
    return TextFormField(
        decoration:
            InputDecoration(labelText: 'Password', hintText: 'Password'),
        obscureText: true, // more like secureTextEntry in RN
        validator: (String value) {
          var error;
          error = null;
          if (!value.contains('@')) {
            error = 'Please enter a valid password';
          } else if (value.length < 4) {
            error = 'Password length cannot be less than 4 chars';
          }
          return error;
        });
  }

  Widget submitButton() {
    return RaisedButton(
        child: Text(
          'Submit',
          style: TextStyle(color: Colors.white),
        ),
        color: Colors.blueAccent,
        onPressed: () {
          formKey.currentState.validate();
        });
  }
}
