import 'package:flutter/material.dart';
import 'package:lotus/helpers/screen_helper.dart';
import 'package:lotus/ui/widget/custom_appBar.dart';
import 'package:lotus/ui/widget/custom_text.dart';

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: customAppBar(
            context: context,
            onPressed: () {},
            transparent: false,
            isHome: false),
        body: ListView(
          padding: EdgeInsets.all(15),
          children: [
            SizedBox(
              height: ScreenHelper.screenHeight(context, 7),
            ),
            CustomText(
              text: "عن التطبيق",
              fontW: FW.bold,
              fontSize: 20,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: ScreenHelper.screenHeight(context, 16),
            ),
            Image.asset(
              "assets/img/logo.png",
              height: ScreenHelper.screenHeight(context, 105),
              width: ScreenHelper.screenWidth(context, 161),
            ),
            SizedBox(
              height: ScreenHelper.screenHeight(context, 136),
            ),
            CustomText(
              text:
                  "هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة.النص لن يبدو مقسما ولا يحوي أخطاء لغوية،ومن هنا وجب على المصمم أن يضع نصوصا مؤقتة على التصميم ليظهر للعميل الشكل كاملاً",
              fontSize: ScreenHelper.screenFont(context, 15),
            )
          ],
        ));
  }
}
