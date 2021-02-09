import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// Dart Packages
// Flutter packages
// Screens
// Widgets
// Providers
// Models
// Helpers
import '../../utils/constants.dart';
import '../../helpers/screen_helper.dart';

class CustomTextField extends StatefulWidget {
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
  final String prefixIcon;
  final int maxLines;
  final double verticalPadding;
  final double horizentalPadding;
  final colorFocused;

  CustomTextField(
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
        this.suffixIconImage,
        this.prefixIcon = null,
        this.maxLines = 1,
        this.horizentalPadding = 15.0,
        this.verticalPadding = 0.0,
        this.colorFocused,
      });

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
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
    return TextFormField(
      maxLines: widget.maxLines,
      onEditingComplete: widget.onComplete,
      onTap: widget.onTap,
      keyboardType: widget.keyboardType,
      focusNode: focusNode,
      style: Theme.of(context).textTheme.subtitle2.copyWith(
        color: ConstColors.TEXT_GREY2,
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
      textDirection: TextDirection.rtl,
      textAlign: TextAlign.right,
      cursorColor: widget.colorFocused ?? ConstColors.ORANGE_COLOR,
      decoration: InputDecoration(
        filled: true,
        fillColor: widget.backColor,
        suffixText: widget.suffixText,
        suffixStyle: Theme.of(context).textTheme.subtitle2.copyWith(
          color: ConstColors.MAIN_COLOR,
          fontSize: ScreenHelper.screenFont(context, 17.0),
        ),
        prefixIcon: widget.prefixIcon != null
            ? Padding(
          padding: const EdgeInsets.only(right: 15, left: 10),
          child: Image(
            image: AssetImage(widget.prefixIcon),
            width: ScreenHelper.screenWidth(context, 18),
            color: isFocus || widget.controller.text.isNotEmpty
                ? ConstColors.ORANGE_COLOR
                : ConstColors.FORM_COLOR,
          ),
        )
            : null,
        prefixIconConstraints: BoxConstraints(
            maxWidth: ScreenHelper.screenWidth(context, 40),
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
            vertical: ScreenHelper.screenWidth(context, widget.verticalPadding),
            horizontal:
            ScreenHelper.screenWidth(context, widget.horizentalPadding)),
        hintText: "${widget.hint}",
//                labelText: "${widget.label}",
        hintStyle: Theme.of(context).textTheme.subtitle2.copyWith(
            fontSize: ScreenHelper.screenFont(context,14.0),
            color: ConstColors.TEXT_GREY2,

        ),
        labelStyle: Theme.of(context).textTheme.caption.copyWith(
          // color: Colors.black,
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
        disabledBorder:  OutlineInputBorder(
          borderRadius:
          BorderRadius.circular(ScreenHelper.screenRadius(context, 28.0)),
          borderSide: BorderSide(
              color: ConstColors.FORM_COLOR,
              width: ScreenHelper.screenWidth(context, 1)),
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
              color:widget.colorFocused ??  ConstColors.ORANGE_COLOR,
              width: ScreenHelper.screenWidth(context, 1)),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius:
          BorderRadius.circular(ScreenHelper.screenRadius(context, 28.0)),
          borderSide: BorderSide(
              color: Colors.red, width: ScreenHelper.screenWidth(context, 1)),
        ),
      ),
    );
  }
}