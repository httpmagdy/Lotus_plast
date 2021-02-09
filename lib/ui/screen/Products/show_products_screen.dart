import 'package:flutter/material.dart';
import 'package:lotus/helpers/screen_helper.dart';
import 'package:lotus/ui/widget/custom_appBar.dart';
import 'package:lotus/ui/widget/custom_button.dart';
import 'package:lotus/ui/widget/custom_text.dart';

class ShowProductsScreen extends StatelessWidget {
  final bool haveAppbar;
  ShowProductsScreen({this.haveAppbar = false});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: haveAppbar ? customAppBar(context: context,isHome: false) : null,

      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: ScreenHelper.screenWidth(context, 25),
          vertical: 20,
        ),
        child: Column(
          children: [
            Image.asset(
              "assets/img/showProducts.png",
              // height: ScreenHelper.screenHeight(context, 249),
              width: ScreenHelper.screenWidth(context, 320),
            ),
            SizedBox(
              height: ScreenHelper.screenHeight(context, 23),
            ),
            CustomText(
              text: "عرض المنتجات",
              fontSize: ScreenHelper.screenFont(context, 25),
              fontW: FW.bold,
            ),
            CustomText(
              text: "لتتمكن من رؤية  المنتجات قم بتحميل الملف ",
              fontSize: ScreenHelper.screenFont(context, 10),
            ),
            SizedBox(
              height: 50,
            ),
            SimpleCustomButton(
              text: 'تنزيل الملف',
              onTap: () {},
              // bgColor: ConstColors.GREEN_COLOR,
            ),
          ],
        ),
      ),
    );
  }
}
