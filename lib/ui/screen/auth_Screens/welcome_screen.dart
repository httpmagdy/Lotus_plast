import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lotus/ui/widget/header.dart';
import 'package:lotus/utils/constants.dart';
import '../../../helpers/screen_helper.dart';
import '../../widget/custom_button.dart';
import './signup_screen.dart';
import 'login_screen.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Header(),
          Align(
              alignment: Alignment.center,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: ScreenHelper.screenHeight(context, 150),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: ScreenHelper.screenWidth(context, 20)),
                  child: Column(
                    children: [
                      Text(
                        "انضم الينا",
                        style: Theme.of(context).textTheme.headline1.copyWith(
                            fontSize: ScreenHelper.screenFont(context, 16)),
                      ),
                      Text(
                        "قم بتسجيل الدخول او انشئ حساب جديد",
                        textAlign: TextAlign.center,
                        textDirection: TextDirection.rtl,
                        style: Theme.of(context).textTheme.subtitle1.copyWith(
                              fontSize: ScreenHelper.screenFont(context, 15),
                              color: ConstColors.GREY_COLOR,
                            ),
                      ),
                    ],
                  ),
                ),
              )),
          Padding(
            padding: EdgeInsets.only(
              bottom: 100,
              left: ScreenHelper.screenWidth(context, 30),
              right: ScreenHelper.screenWidth(context, 30),
            ),
            child: Align(
                alignment: Alignment.bottomCenter,
                child: SimpleCustomButton(
                  bgColor: ConstColors.GREEN_COLOR,
                  onTap: () {
                    Get.to(LoginScreen(), transition: Transition.leftToRight);
                  },
                  width: ScreenHelper.screenSize(context).width,
                  text: "تسجيل الدخول",
                ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              bottom: 30,
              left: ScreenHelper.screenWidth(context, 30),
              right: ScreenHelper.screenWidth(context, 30),
            ),
            child: Align(
                alignment: Alignment.bottomCenter,
                child: SimpleCustomButton(
                  onTap: () {
                    Get.to(SignUpScreen(), transition: Transition.leftToRight);
                  },
                  width: ScreenHelper.screenSize(context).width,
                  text: "انشاء حساب",
                  bgColor: ConstColors.GREEN_COLOR,
                  outlineButton: true,
                )),
          ),
        ],
      ),
    );
  }
}
