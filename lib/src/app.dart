import 'package:flutter/material.dart';
import 'package:flutter_app/src/screens/login_screen.dart';
import 'package:flutter_app/src/blocs/provider.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
        child: MaterialApp(
      title: 'Log-me in BLOC',
      home: Scaffold(
        body: LoginScreen(),
      ),
    ));
  }
}
