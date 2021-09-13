import 'package:caribayapp/Utils/Colors.dart';
import 'package:flutter/material.dart';
import 'package:sad_lib/CustomWidgets.dart';

class ButtonWidget extends StatefulWidget {
  final void Function() onPressed;
  final String text;
  final Widget widget;
  final EdgeInsets margin;
  final EdgeInsets padding;
  final Alignment alignment;
  ButtonWidget({Key key, this.onPressed,
    this.margin = EdgeInsets.zero,
    this.alignment = Alignment.center,
    this.widget,
    this.text,
    this.padding = const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0,),
  }) : super(key: key);
  @override
  _ButtonWidgetState createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: widget.alignment,
      child: Padding(
        padding: widget.margin,
        child: InkWell(
          onTap: widget.onPressed,
          hoverColor: Colors.transparent,
          highlightColor: AppColors.primary.withOpacity(0.5,),
          splashColor: Colors.transparent,
          borderRadius: BorderRadius.circular(7.5,),
          child: Container(
            width: double.infinity,
            padding: widget.padding,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7.5,),
              border: Border.all(color: AppColors.primary, width: 0.5,),
            ),
            child: (widget.widget == null) ? TextView(text: widget.text ?? "",
              size: 15.0,
              color: AppColors.primary,
              fontWeight: FontWeight.w500,
            ) : widget.widget,
          ),
        ),
      ),
    );
  }

}
