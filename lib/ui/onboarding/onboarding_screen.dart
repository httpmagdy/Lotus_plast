import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:lotus/ui/screen/auth_Screens/welcome_screen.dart';
import 'package:lotus/ui/widget/custom_text.dart';
import '../../helpers/screen_helper.dart';
import '../../utils/constants.dart';
import 'onboarding_item.dart';
import 'onboarding_model.dart';

class OnBoardingScreen extends StatefulWidget {
  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int _currentPage = 0;
  // int _currentScreen = 0;
  final PageController _pageController = PageController(initialPage: 0);

  GetStorage box = GetStorage("onBoarding");

  @override
  void initState() {
    super.initState();
//    Timer.periodic(Duration(seconds: 3), (Timer timer) {
//      if (_currentPage < 2) {
//        _currentPage++;
//      } else {
//        _currentPage=0;
//      }
//
//      _pageController.animateToPage(
//        _currentPage,
//        duration: Duration(milliseconds: 300),
//        curve: Curves.easeIn,
//      );
//    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  _onchanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView.builder(
            allowImplicitScrolling: false,
            scrollDirection: Axis.horizontal,
            controller: _pageController,
            onPageChanged: _onchanged,
            itemCount: onBoardingLists.length,
            itemBuilder: (ctx, i) => OnBoardingItem(
              index: i,
            ),
          ),
//          Padding(
//            padding: EdgeInsets.only(
//              bottom: ScreenHelper.screenHeight(context, 200),
//            ),
//            child: Align(
//              alignment: Alignment.bottomCenter,
//              child: Row(
//                mainAxisAlignment: MainAxisAlignment.center,
//                children: [
//                  for (int i = 0; i < 4; i++)
//                    Padding(
//                      padding: EdgeInsets.symmetric(
//                          horizontal: ScreenHelper.screenWidth(context, 2.5)),
//                      child: OnBoardingDot(
//                        isActive: i == _currentPage,
//                      ),
//                    ),
//                ],
//              ),
//            ),
//          ),
//          Padding(
//            padding: EdgeInsets.only(
//              bottom: ScreenHelper.screenHeight(context, 37),
//            ),
//            child: Padding(
//              padding: EdgeInsets.symmetric(
//                  horizontal: ScreenHelper.screenWidth(context, 86)),
//              child: Align(
//                alignment: Alignment.bottomCenter,
//                child: Container(
//                  height: ScreenHelper.screenHeight(context, 100),
//                  child: Column(
//                    children: [
//                      SizedBox(
//                        height: ScreenHelper.screenHeight(context, 16),
//                      ),
//                      GestureDetector(
//                        onTap: () {
//                          if (_currentPage < 3) {
//                            _pageController.animateToPage(
//                              3,
//                              duration: Duration(milliseconds: 500),
//                              curve: Curves.easeIn,
//                            );
//                          } else {
////                            Get.offAll(SignUpScreen());
//                          }
//                        },
//                        child: Text(
//                          _currentPage < 3
//                              ? "Skip for now"
//                              : "register new account",
//                          style: Theme.of(context).textTheme.caption.copyWith(
//                              color: GREY_COLOR,
//                              fontSize: ScreenHelper.screenFont(context, 14)),
//                        ),
//                      )
//                    ],
//                  ),
//                ),
//              ),
//            ),
//          ),
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: ScreenHelper.screenHeight(context, 30),
                horizontal: ScreenHelper.screenWidth(context, 29)),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      box.write("onBoarding", true);
                      Get.offAll(WelcomeScreen());
                    },
                    child: Text(
                      "تخطي",
                      style: Theme.of(context).textTheme.subtitle1.copyWith(
                          fontSize: ScreenHelper.screenFont(context, 18)),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      if (_currentPage < 3) {
                        _pageController.animateToPage(
                          _currentPage + 1,
                          duration: Duration(milliseconds: 500),
                          curve: Curves.easeIn,
                        );
                      } else {
                        box.write("onBoarding", true);
                        Get.offAll(WelcomeScreen());
                      }
                    },
                    child: CircleAvatar(
                      backgroundColor: ConstColors.MAIN_COLOR,
                      radius: ScreenHelper.screenWidth(context, 28),
                      child: CustomText(
                        text: 'التالي',
                        color: ConstColors.WHITE,
                        fontW: FW.semibold,
                      ),
                      // child: Icon(
                      //   Icons.arrow_forward,
                      //   color: Colors.white,
                      //   size: ScreenHelper.screenWidth(context, 25),
                      // ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
