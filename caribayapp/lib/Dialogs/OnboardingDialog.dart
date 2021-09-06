import 'package:caribayapp/Utils/Colors.dart';
import 'package:caribayapp/Widgets/ButtonWidget.dart';
import 'package:flutter/material.dart';

class OnboardingDialog extends StatefulWidget {
  OnboardingDialog({Key key}) : super(key: key);
  @override
  _OnboardingDialogState createState() => _OnboardingDialogState();
}

class _OnboardingDialogState extends State<OnboardingDialog> {

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.background,
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [

                ],
              ),
            ),
          ),
          ButtonWidget(
            onPressed: (){

            },
            margin: EdgeInsets.symmetric(vertical: 20.0,),
            text: "Continue",
          ),
        ],
      ),
    );
  }

}
