import 'package:flutter/material.dart';

import '../../helpers/screen_helper.dart';
import '../../utils/constants.dart';
import 'custom_text.dart';

//
class CustomButton extends StatelessWidget {
  double width;
  String title;
  Widget child;
  bool isActive;
  Color buttonColor;
  Color strokeColor;
  Color textColor;
  Function onTap;

  CustomButton(
      {this.width = 181,
      this.title = null,
      this.child = null,
      this.isActive = true,
      this.buttonColor = null,
      this.strokeColor = Colors.transparent,
      this.textColor = Colors.white,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: ScreenHelper.screenWidth(context, width),
      child: RaisedButton(
        onPressed: onTap,
        elevation: 0.0,
        child: title != null
            ? Text(
                title,
                style: Theme.of(context).textTheme.headline2.copyWith(
                    fontSize: ScreenHelper.screenFont(context, 16),
                    color: textColor),
              )
            : Text(
                " ",
                style: Theme.of(context).textTheme.headline2.copyWith(
                    fontSize: ScreenHelper.screenFont(context, 16),
                    color: Colors.white),
              ),
        shape: RoundedRectangleBorder(
            side: BorderSide(color: strokeColor, width: 2),
            borderRadius: new BorderRadius.circular(
                ScreenHelper.screenRadius(context, 40))),
        color: buttonColor != null
            ? buttonColor
            : (isActive ? ConstColors.MAIN_COLOR : ConstColors.ORANGE_COLOR),
//      hoverColor: Colors.purpleAccent,
//      focusColor: Colors.red,
        highlightColor: Colors.black,
      ),
    );
  }
}

class SimpleCustomButton extends StatelessWidget {
  final double height, width;
  final String text;
  final Function onTap;
  final bgColor;
  final textColor;
  final bool outlineButton;
  final Widget child;
  final fontSize;

  SimpleCustomButton({
    this.height,
    this.onTap,
    this.text,
    this.width,
    this.bgColor = ConstColors.ORANGE_COLOR,
    this.textColor,
    this.outlineButton = false,
    this.child,
    this.fontSize,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: ScreenHelper.screenHeight(context, 57),
      height: height ?? 50,
      width: ScreenHelper.screenWidth(context, width ?? 160),
      child: RaisedButton(
        onPressed: onTap,
        elevation: 0.0,
        child: child ??
            CustomText(
              text: text,
              color: outlineButton ? bgColor : textColor ?? ConstColors.WHITE,
              fontSize: fontSize ?? 14,
              fontW: FW.bold,
            ),
        shape: RoundedRectangleBorder(
          side: BorderSide(color: bgColor, width: 2),
          borderRadius: BorderRadius.circular(
            ScreenHelper.screenRadius(context, 40),
          ),
        ),
        color: outlineButton
            ? ConstColors.WHITE
            : bgColor ?? ConstColors.ORANGE_COLOR,
        // highlightColor: Colors.black,
      ),
    );
  }
}
