import 'package:flutter/material.dart';
import 'package:flutter_app/src/blocs/provider.dart';
import 'package:flutter_app/src/blocs/bloc.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);
    return Container(
      margin: EdgeInsets.all(20.00),
      padding: EdgeInsets.only(top: 140.00),
      child: Column(
        children: <Widget>[
          emailField(bloc),
          passwordField(bloc),
          Container(
            margin: EdgeInsets.only(bottom: 20.0, top: 25.00),
          ),
          submitButton()
        ],
      ),
    );
  }

  Widget emailField(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.email,
      builder: (context, snapshot) {
        return TextField(
          keyboardType: TextInputType.emailAddress,
          onChanged: bloc.changeEmail, // action to be called on email change
          decoration: InputDecoration(
              hintText: 'you@example.com',
              labelText: "Email Address",
              errorText: snapshot.error),
        );
      },
    );
  }

  Widget passwordField(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.password,
      builder: (context, snapshot) {
        return TextField(
          onChanged: bloc.changePassword,
          obscureText: true,
          decoration: InputDecoration(
              hintText: 'Password',
              labelText: 'Password',
              errorText: snapshot.error),
        );
      },
    );
  }

  Widget submitButton() {
    return RaisedButton(
      child: Text("Submit"),
      color: Colors.blue,
      onPressed: () {},
    );
  }
}
