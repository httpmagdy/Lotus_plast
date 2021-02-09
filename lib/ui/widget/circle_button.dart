import 'package:flutter/material.dart';
import 'package:lotus/helpers/screen_helper.dart';
import 'package:lotus/utils/constants.dart';

import 'custom_text.dart';

class CircleButton extends StatelessWidget {
  final Function onTap;

  CircleButton({this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: ScreenHelper.screenWidth(context, 56),
        width: ScreenHelper.screenWidth(context, 56),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [Color(0xffB7F645), Color(0xff92CD28)],
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(ScreenHelper.screenWidth(context, 30)),
          ),
        ),
        child: Center(child: CustomText(text: 'دخول',fontW: FW.semibold, color: ConstColors.WHITE,)),
        // child: Icon(
        //   Icons.arrow_forward,
        //   color: Colors.white,
        //   size: ScreenHelper.screenWidth(context, 30),
        // ),
      ),
    );
  }
}
