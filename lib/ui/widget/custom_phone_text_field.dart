import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../helpers/screen_helper.dart';
// Dart Packages
// Flutter packages
// Screens
// Widgets
// Providers
// Models
// Helpers
import '../../utils/constants.dart';

class CustomPhoneTextField extends StatefulWidget {
  final TextEditingController controller;
  final String errorMessage;
  final String label;
  final String hint;
  final String question;
  final IconData suffixIcon;
  final bool enabled;
  final Color backColor;
  final isSecure;
  final String suffixText;
  final TextInputType keyboardType;
  final String shortMessage;
  final int shortCondition;
  final Function validator;
  final bool isTitle;
  final Function onTap;
  final Function onSuffixTap;
  final Function onComplete;
  final String suffixIconImage;

  CustomPhoneTextField(
      {this.onComplete,
      this.onSuffixTap,
      this.onTap,
      this.isTitle = true,
      this.validator = null,
      this.shortCondition = 0,
      this.shortMessage = "",
      this.keyboardType = TextInputType.text,
      this.suffixText,
      this.isSecure = false,
      this.enabled = true,
      this.controller,
      this.errorMessage,
      this.hint = " ",
      this.label,
      this.question = "",
      this.suffixIcon = null,
      this.backColor = Colors.transparent,
      this.suffixIconImage});

  @override
  _CustomPhoneTextFieldState createState() => _CustomPhoneTextFieldState();
}

class _CustomPhoneTextFieldState extends State<CustomPhoneTextField> {
  FocusNode focusNode;
  bool isFocus = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    focusNode = FocusNode();
    focusNode.addListener(() {
      setState(() {
        isFocus = focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: TextFormField(
        onEditingComplete: widget.onComplete,
        onTap: widget.onTap,
        keyboardType: widget.keyboardType,
        focusNode: focusNode,
        style: Theme.of(context).textTheme.subtitle2.copyWith(
              color: ConstColors.ORANGE_COLOR,
              fontSize: ScreenHelper.screenFont(context, 17.0),
            ),
        controller: widget.controller,
        obscureText: widget.isSecure,
        enabled: widget.enabled,
        validator: widget.validator != null
            ? widget.validator
            : (value) {
                if (value.isEmpty) return widget.errorMessage;
                if (value.length < widget.shortCondition)
                  return widget.shortMessage;
                return null;
              },
        textDirection: TextDirection.ltr,
        textAlign: TextAlign.left,
        cursorColor: ConstColors.ORANGE_COLOR,
        decoration: InputDecoration(
          filled: true,
          fillColor: widget.backColor,
          suffixText: widget.suffixText,
          suffixStyle: Theme.of(context).textTheme.subtitle2.copyWith(
                color: ConstColors.MAIN_COLOR,
                fontSize: ScreenHelper.screenFont(context, 17.0),
              ),
          prefixIcon: Container(
            child: Row(
              textDirection: TextDirection.ltr,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: ScreenHelper.screenWidth(context, 21),
                  width: ScreenHelper.screenWidth(context, 21),
                  decoration: BoxDecoration(
                      color: ConstColors.ORANGE_COLOR,
                      borderRadius: BorderRadius.all(Radius.circular(
                          ScreenHelper.screenRadius(context, 15)))),
                ),
                SizedBox(
                  width: ScreenHelper.screenWidth(context, 6),
                ),
                Text(
                  "+20",
                  style: Theme.of(context).textTheme.subtitle1.copyWith(
                      fontSize: ScreenHelper.screenFont(context, 16),
                      color: Color(0xff3F404B)),
                ),
                SizedBox(
                  width: ScreenHelper.screenWidth(context, 5),
                ),
                Container(
                  color: ConstColors.ORANGE_COLOR,
                  width: 1,
                  height: ScreenHelper.screenHeight(context, 23),
                ),
              ],
            ),
          ),
//          Image(
//            image: AssetImage("assets/img/blumber.png"),
//            width: ScreenHelper.screenWidth(context, 40),
//            color: isFocus || widget.controller.text.isNotEmpty
//                ? ConstColors.ORANGE_COLOR
//                : ConstColors.FORM_COLOR,
//          ),
          prefixIconConstraints: BoxConstraints(
              maxWidth: ScreenHelper.screenWidth(context, 90),
              maxHeight: ScreenHelper.screenHeight(context, 25)),
          suffixIcon: widget.suffixIcon == null
              ? null
              : IconButton(
                  onPressed: widget.onSuffixTap,
                  icon: Icon(
                    widget.suffixIcon,
                    color: isFocus || widget.controller.text.isNotEmpty
                        ? ConstColors.ORANGE_COLOR
                        : ConstColors.FORM_COLOR,
                    size: ScreenHelper.screenWidth(context, 20.0),
                  )),
          contentPadding: EdgeInsets.symmetric(
              vertical: 0, horizontal: ScreenHelper.screenWidth(context, 9.0)),
          hintText: "${widget.hint}",
//                labelText: "${widget.label}",
          hintStyle: Theme.of(context).textTheme.subtitle2.copyWith(
              fontSize: ScreenHelper.screenFont(context, 17.0),
              color: ConstColors.FORM_COLOR),
          labelStyle: Theme.of(context).textTheme.caption.copyWith(
                fontSize: ScreenHelper.screenFont(context, 14.0),
              ),
          errorStyle: Theme.of(context).textTheme.subtitle2.copyWith(
              fontSize: ScreenHelper.screenFont(context, 11.0),
              color: Colors.red),
          //prefix: Text("اظهار"),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(28.0),
            borderSide: BorderSide(
              width: 1,
              color: Colors.red,
              //style: BorderStyle.solid,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius:
                BorderRadius.circular(ScreenHelper.screenRadius(context, 28.0)),
            borderSide: BorderSide(
                color: ConstColors.FORM_COLOR,
                width: ScreenHelper.screenWidth(context, 1)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius:
                BorderRadius.circular(ScreenHelper.screenRadius(context, 28.0)),
            borderSide: BorderSide(
                color: ConstColors.ORANGE_COLOR,
                width: ScreenHelper.screenWidth(context, 1)),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius:
                BorderRadius.circular(ScreenHelper.screenRadius(context, 28.0)),
            borderSide: BorderSide(
                color: Colors.red, width: ScreenHelper.screenWidth(context, 1)),
          ),
        ),
      ),
    );
  }
}
