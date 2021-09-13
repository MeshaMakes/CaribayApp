import 'package:caribayapp/Utils/Colors.dart';
import 'package:caribayapp/Widgets/ButtonWidget.dart';
import 'package:flutter/material.dart';
import 'package:sad_lib/CustomWidgets.dart';

class OnBoardingDialog extends StatefulWidget {
  OnBoardingDialog({Key key}) : super(key: key);
  @override
  _OnBoardingDialogState createState() => _OnBoardingDialogState();
}

class _OnBoardingDialogState extends State<OnBoardingDialog> {

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.background,
      child: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 50.0,),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0,),
                physics: BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _title(),
                    _listView(),
                  ],
                ),
              ),
            ),
            ButtonWidget(
              onPressed: (){

              },
              text: "CONTINUE",
              margin: EdgeInsets.symmetric(vertical: 30.0, horizontal: 20.0,),
            ),
          ],
        ),
      ),
    );
  }

  Widget _title(){
    return TextView(text: "What's New in Caribay",
      color: AppColors.white,
      align: TextAlign.center,
      size: 40.0,
      padding: EdgeInsets.only(top: 50.0, bottom: 50.0,),
      fontWeight: FontWeight.w600,
    );
  }

  Widget _listView(){
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 10,
      scrollDirection: Axis.vertical,
      padding: EdgeInsets.symmetric(vertical: 10.0,),
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index){
        return _itemCard();
      },
    );
  }

  Widget _itemCard(){
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0,),
      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0,),
      decoration: BoxDecoration(
        color: AppColors.darkGrey.withOpacity(0.25,),
        borderRadius: BorderRadius.circular(7.5,),
      ),
      child: Row(
        children: [
          Icon(Icons.wifi_tethering,
            size: 40.0,
            color: AppColors.primary,
          ),
          SizedBox(width: 20.0,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextView(text: "What's new in Caribay",
                  color: AppColors.white,
                  letterSpacing: 0.0,
                  size: 17.5,
                  fontWeight: FontWeight.w500,
                ),
                TextView(text: "What's new in Caribay",
                  color: AppColors.lightGrey,
                  size: 15.0,
                  fontWeight: FontWeight.w400,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

}
