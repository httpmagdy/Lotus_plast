import 'package:flutter/material.dart';
import 'package:lotus/helpers/screen_helper.dart';
import 'package:lotus/utils/constants.dart';

import 'custom_text.dart';

class CardMenu extends StatelessWidget {
  final onTap;
  final icon, title;
  CardMenu({this.icon, this.onTap, this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: ScreenHelper.screenSize(context).width * 0.44,
          // height: ScreenHelper.screenHeight(ctx, 80),
          padding: EdgeInsets.only(
              top: ScreenHelper.screenHeight(context, 20),
              bottom: ScreenHelper.screenHeight(context, 15)),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: ConstColors.WHITE,
            // border: Border.all(width: 0.8, color: Colors.grey.shade300),
            boxShadow: [
              BoxShadow(
                blurRadius: 8.0,
                spreadRadius: 0.4,
                offset: Offset(0.1, 2.4),
                color: ConstColors.GREY_COLOR.withOpacity(0.5),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/img/icons/$icon',
                width: ScreenHelper.screenWidth(context, 30),
                height: ScreenHelper.screenHeight(context, 30),
              ),
              SizedBox(height: ScreenHelper.screenHeight(context, 5)),
              CustomText(
                text: '$title',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
