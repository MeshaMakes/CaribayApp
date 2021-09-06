import 'package:flutter/material.dart';
import 'package:caribayapp/Utils/Colors.dart';
import 'package:sad_lib/CustomWidgets.dart';

class TextFieldWidget extends StatefulWidget {
  final Widget suffix;
  final EdgeInsets margin;
  final String title;
  final String hintText;
  final TextInputType textInputType;
  final double textSize;
  final Color textColor;
  final Color focusColor;
  final IconData icon;
  final void Function(String newText) onChanged;

  const TextFieldWidget({Key key,
    this.margin = EdgeInsets.zero,
    this.title,
    this.hintText,
    this.textInputType = TextInputType.text,
    this.textSize = 15,
    this.textColor = Colors.white,
    this.icon,
    this.focusColor,
    this.onChanged,
    this.suffix,
  }) : super(key: key);
  @override
  _TextFieldWidgetState createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {

  FocusNode node = FocusNode();

  @override
  void initState() {
    super.initState();
    node.addListener(() {
      setState(() {

      });
      if(node.hasFocus){

      }else{

      }
    });
  }

  @override
  void dispose() {
    node.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.margin,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if(widget.title != null)
            TextView(text: widget.title,
              padding: EdgeInsets.only(bottom: 5.0,),
              color: widget.textColor,
              size: 10.0,
              fontWeight: FontWeight.w300,
            ),

          TweenAnimationBuilder<double>(
            tween: Tween<double>(begin: 0.5, end: 0.0,),
            duration: Duration(seconds: 2,),
            builder: (context, value, child){
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0,),
                  border: Border.all(color: AppColors.white.withOpacity(value,), width: 0.5,),
                ),
                child: child,
              );
            },
            child: TextField(
              autocorrect: true,
              autofocus: false,
              enableSuggestions: true,
              maxLines: 1,
              obscureText: widget.textInputType == TextInputType.visiblePassword ? true : false,
              onChanged: (text){
                if(widget.onChanged != null){
                  widget.onChanged(text,);
                }
              },
              textAlignVertical: TextAlignVertical.center,
              textCapitalization: TextCapitalization.sentences,
              textInputAction: TextInputAction.next,
              keyboardType: widget.textInputType,
              focusNode: node,
              toolbarOptions: ToolbarOptions(cut: true, copy: true, paste: true, selectAll: true,),
              cursorColor: widget.textColor,
              style: TextStyle(color: widget.textColor, fontSize: widget.textSize, fontWeight: FontWeight.w400,),
              decoration: InputDecoration(
                prefixIcon: (widget.icon == null) ? null : Icon(widget.icon,
                  color: widget.focusColor ?? AppColors.lightGrey,
                  size: 20.0,
                ),
                isDense: true,
                hintText: widget.hintText ?? "",
                suffix: widget.suffix,
                filled: true,
                fillColor: AppColors.darkGrey.withOpacity(0.25,),
                hintStyle: TextStyle(color: widget.textColor.withOpacity(0.5), fontSize: widget.textSize, fontWeight: FontWeight.w300,),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0,), borderSide: BorderSide(color: widget.textColor.withOpacity(0.25,), width: 0.25,),),
                focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0,), borderSide: BorderSide(color: widget.textColor.withOpacity(0.25,), width: 0.25,),),
                enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0,), borderSide: BorderSide(color: widget.textColor.withOpacity(0.25,), width: 0.25,),),
                contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0,),
              ),
            ),
          )
        ],
      ),
    );
  }

}
