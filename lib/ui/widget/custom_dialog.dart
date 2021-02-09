import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:lotus/helpers/screen_helper.dart';
import 'package:get/get.dart';
import 'package:lotus/ui/widget/custom_text_field.dart';
import 'package:lotus/utils/constants.dart';
import 'custom_button.dart';
import 'custom_text.dart';

class CustomDialog extends StatelessWidget {
  final onTapYes;
  final String buttonName, title, body, image;

  CustomDialog(
      {this.onTapYes, this.buttonName, this.title, this.body, this.image});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 30),
        width: ScreenHelper.screenSize(context).width,
        height: 250,
        child: Material(
          borderRadius: BorderRadius.circular(25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // SizedBox(height: ScreenHelper.screenHeight(context, 10)),
              CustomText(
                text: title ?? '',
                fontSize: 20,
                fontW: FW.bold,
              ),
              Image.asset(
                '$image',
                width: ScreenHelper.screenWidth(context, 60),
                height: ScreenHelper.screenHeight(context, 60),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 25),
                child: CustomText(
                  text: '$body',
                  fontSize: 12,
                  textAlign: TextAlign.center,
                ),
              ),
              Divider(
                color: Colors.grey,
                // height: 0,
              ),
              SizedBox(
                height: 40,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: GestureDetector(
                        child: CustomText(
                          text: 'نعم',
                          textAlign: TextAlign.center,
                          color: ConstColors.GREEN_COLOR,
                        ),
                        onTap: onTapYes,
                      ),
                    ),
                    Container(
                      color: Colors.grey,
                      width: 1,
                      height: 25,
                    ),
                    // Spacer(),
                    Expanded(
                      child: GestureDetector(
                        child: CustomText(
                          text: 'لا',
                          textAlign: TextAlign.center,
                        ),
                        onTap: () => Get.back(),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DialogPoint extends StatelessWidget {
  final onTapOk;
  final buttonColor;
  final String buttonName, title, body, image;
  final Widget child;
  final double height, buttonWidth;

  DialogPoint({
    this.onTapOk,
    this.buttonName,
    this.title,
    this.body,
    this.image,
    this.child,
    this.height,
    this.buttonColor,
    this.buttonWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        // padding: EdgeInsets.symmetric(vertical: 20 ),
        margin: EdgeInsets.symmetric(horizontal: 30),
        width: ScreenHelper.screenSize(context).width,
        height: height ?? ScreenHelper.screenHeight(context, 355),
        child: Material(
          borderRadius: BorderRadius.circular(25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // SizedBox(height: ScreenHelper.screenHeight(context, 10)),
              title!= null?   CustomText(
                text: title ?? '',
                fontSize: 20,
                fontW: FW.bold,
              ):Container(),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: child,
              ),

              SimpleCustomButton(
                width: ScreenHelper.screenWidth(context, buttonWidth ?? 160),

                bgColor: buttonColor ?? ConstColors.ORANGE_COLOR,
                text: buttonName ?? 'موافق',
                onTap: onTapOk,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OkDialog extends StatelessWidget {
  final onTapOk;
  final String buttonName, title, body, image;
  final Widget child;

  OkDialog({
    this.onTapOk,
    this.buttonName,
    this.title,
    this.body,
    this.image,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 30),
        width: ScreenHelper.screenSize(context).width,
        height: ScreenHelper.screenHeight(context, 355),
        child: Material(
          borderRadius: BorderRadius.circular(25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // SizedBox(height: ScreenHelper.screenHeight(context, 10)),
              CustomText(
                text: title ?? '',
                fontSize: 20,
                fontW: FW.bold,
              ),

              CustomText(
                text: '$body',
                fontSize: 12,
                textAlign: TextAlign.center,
              ),

              Padding(
                padding: const EdgeInsets.only(top: 15, bottom: 25),
                child: Image.asset(
                  '$image',
                  width: ScreenHelper.screenWidth(context, 100),
                  height: ScreenHelper.screenHeight(context, 100),
                ),
              ),

              SimpleCustomButton(
                text: buttonName ?? 'موافق',
                onTap: onTapOk,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

