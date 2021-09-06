import 'package:caribayapp/Utils/Enums.dart';
import 'package:caribayapp/Widgets/ButtonWidget.dart';
import 'package:caribayapp/Widgets/TextFieldWidget.dart';
import 'package:caribayapp/Widgets/IconBtnWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sad_lib/CustomWidgets.dart';
import 'package:caribayapp/Utils/Colors.dart';

class AuthScreen extends StatefulWidget {
  final AuthState authState;
  AuthScreen({Key key,
    this.authState = AuthState.login,
  }) : super(key: key);
  @override
  _AuthScreenController createState() => _AuthScreenController();
}

class _AuthScreenController extends State<AuthScreen> {

  bool showRegister;

  @override
  void initState() {
    showRegister = false;
    super.initState();
    if(widget.authState == AuthState.login){ // TODO

    }else{ // TODO

    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.background,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                padding: EdgeInsets.symmetric(horizontal: 20.0,),
                child: AnimatedCrossFade(
                  crossFadeState: showRegister ? CrossFadeState.showFirst : CrossFadeState.showSecond,
                  duration: Duration(milliseconds: 750,),
                  firstChild: _registerView(),
                  secondChild: _loginView(),
                ),
              ),
            ),
            Divider(
              color: AppColors.lightGrey.withOpacity(0.5,),
              thickness: 0.5,
            ),
            ButtonView(
              onPressed: toggleSignUp,
              highlightColor: AppColors.white.withOpacity(0.2,),
              margin: EdgeInsets.only(top: 10.0, bottom: MediaQuery.of(context).viewInsets.bottom + 10,),
              padding: EdgeInsets.symmetric(vertical: 7.5, horizontal: 15.0,),
              alignment: Alignment.bottomCenter,
              child: TextView.rich(
                textSpan: [
                  TextView(
                    text: showRegister ? "Already registered?" : "New to Caribay?",
                    size: 12.5,
                    color: AppColors.white,
                    fontWeight: FontWeight.w300,
                  ),
                  TextView(
                    text: showRegister ? " Login here" : " Register here",
                    size: 12.5,
                    color: AppColors.primary,
                    fontWeight: FontWeight.w300,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _logo(){
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: EdgeInsets.only(top: 10.0, bottom: 40.0,),
        child: Icon(Icons.polymer,
          size: 30.0,
          color: AppColors.primary,
        ),
      ),
    );
  }

  Widget _nextButton(){
    return ButtonWidget(
      onPressed: () {},
      text: showRegister ? "SIGN UP" : "LOG IN",
      alignment: Alignment.centerRight,
      margin: EdgeInsets.only(top: 20.0, bottom: 50.0,),
    );
  }

  Widget _registerView(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _logo(),
        TextFieldWidget(
          key: ValueKey("email"),
          onChanged: (String s) {

          },
          icon: Icons.email_outlined,
          hintText: "Enter email",
          textInputType: TextInputType.emailAddress,
          margin: EdgeInsets.symmetric(vertical: 15.0),
        ),
        TextFieldWidget(
          key: ValueKey("name"),
          onChanged: (String s) {

          },
          icon: Icons.person_pin_outlined,
          hintText: "Enter name",
          textInputType: TextInputType.name,
          margin: EdgeInsets.symmetric(vertical: 15.0),
        ),
        TextFieldWidget(
          key: ValueKey("password"),
          onChanged: (String s) {

          },
          icon: Icons.vpn_key_outlined,
          hintText: "Enter password",
          textInputType: TextInputType.visiblePassword,
          margin: EdgeInsets.only(top: 15.0, bottom: 45.0,),
        ),
        _nextButton(),
      ],
    );
  }

  Widget _loginView(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _logo(),
        TextFieldWidget(
          key: ValueKey("email"),
          onChanged: (String s) {

          },
          icon: Icons.email,
          hintText: "Enter email",
          textInputType: TextInputType.emailAddress,
          margin: EdgeInsets.symmetric(vertical: 15.0),
        ),
        TextFieldWidget(
          key: ValueKey("password"),
          onChanged: (String s) {

          },
          icon: Icons.vpn_key,
          hintText: "Enter password",
          textInputType: TextInputType.visiblePassword,
          margin: EdgeInsets.symmetric(vertical: 15.0),
        ),
        ButtonView(
          onPressed: () {},
          highlightColor: AppColors.white.withOpacity(0.2,),
          margin: EdgeInsets.only(top: 10.0, bottom: 30.0,),
          padding: EdgeInsets.symmetric(vertical: 7.5, horizontal: 15.0,),
          alignment: Alignment.centerRight,
          child: TextView(
            text: "Forgot Password?",
            size: 12.5,
            color: AppColors.lightGrey,
            fontWeight: FontWeight.w400,
          ),
        ),
        _nextButton(),
      ],
    );
  }

  void toggleSignUp() {
    setState(() {
      showRegister = !showRegister;
    });
  }

}