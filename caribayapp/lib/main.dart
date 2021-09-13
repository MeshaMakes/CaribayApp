import 'package:caribayapp/Screens/AuthScreen.dart';
import 'package:caribayapp/Utils/Colors.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(AppWrapper(),);
}

class AppWrapper extends StatelessWidget {
  AppWrapper({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Caribay",
      color: AppColors.primary,
      home: AuthScreen(),
    );
  }
}
