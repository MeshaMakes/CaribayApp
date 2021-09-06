import 'package:flutter/material.dart';
import 'package:caribayapp/Utils/Colors.dart';

class IconBtnWidget extends StatefulWidget {
  final void Function() onPressed;
  final IconData icon;
  final double iconSize;
  final Alignment alignment;
  final EdgeInsets margin;
  final double padding;
  final Color background;
  IconBtnWidget({Key key,
    @required this.onPressed,
    this.alignment,
    this.margin = EdgeInsets.zero,
    this.padding = 15.0,
    this.background,
    this.icon = Icons.arrow_forward_ios_rounded,
    this.iconSize = 20.0,
  }) : super(key: key);
  @override
  _IconBtnWidgetState createState() => _IconBtnWidgetState();
}

class _IconBtnWidgetState extends State<IconBtnWidget> {

  @override
  Widget build(BuildContext context) {
    if(widget.alignment == null){
      return Padding(
        padding: widget.margin,
        child: _container(),
      );
    }else{
      return Align(
        alignment: widget.alignment,
        child: Padding(
          padding: widget.margin,
          child: _container(),
        ),
      );
    }
  }

  Widget _container(){
    return Stack(
      alignment: Alignment.center,
      children: [
        TweenAnimationBuilder(
          tween: Tween<double>(begin: 0.0, end: 1.0,),
          duration: Duration(milliseconds: 1000,),
          builder: (context, value, child){
            return ShaderMask(
              shaderCallback: (rect){
                return SweepGradient(
                  stops: [value, value,],
                  colors: [
                    AppColors.primary,
                    Colors.transparent,
                  ],
                  transform: GradientRotation(-1.57,),
                  center: Alignment.center,
                  startAngle: 0.0,
                  endAngle: 6.28,
                ).createShader(rect,);
              },
              child: child,
            );
          },
          child: Container(
            padding: EdgeInsets.all(widget.padding + 1.25,),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: _icon(),
          ),
        ),
        Material(
          type: MaterialType.circle,
          color: widget.background ?? AppColors.background,
          child: _inkWell(),
        ),
      ],
    );
  }

  Widget _inkWell(){
    return InkWell(
      onTap: widget.onPressed,
      onHover: (flag){

      },
      borderRadius: BorderRadius.circular(360.0,),
      hoverColor: Colors.transparent,
      highlightColor: AppColors.primary.withOpacity(0.5,),
      splashColor: Colors.transparent,
      child: Padding(
        padding: EdgeInsets.all(widget.padding,),
        child: _icon(),
      ),
    );
  }

  Widget _icon(){
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: 0.0, end: 1.0,),
      duration: Duration(milliseconds: 2000,),
      curve: Curves.elasticInOut,
      builder: (context, value, child){
        return Transform.scale(
          scale: value,
          child: child,
        );
      },
      child: Icon(widget.icon,
        size: widget.iconSize,
        color: AppColors.primary,
      ),
    );
  }

}
