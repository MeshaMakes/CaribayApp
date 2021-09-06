import 'package:caribayapp/Screens/AuthScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(AppWrapper(),);
}

class AppWrapper extends StatelessWidget {
  const AppWrapper({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AuthScreen(),
    );
  }
}
