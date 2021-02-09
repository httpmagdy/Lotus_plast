import 'package:flutter/material.dart';
import 'package:lotus/helpers/screen_helper.dart';
import 'package:lotus/ui/screen/Static_Screens/terms_of_warranty_screen/widget/custom_terms_text.dart';
import 'package:lotus/ui/widget/custom_appBar.dart';
import 'package:lotus/ui/widget/custom_text.dart';
import 'package:lotus/utils/constants.dart';

class TermsOfWarrantyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
          context: context,
          onPressed: () {},
          transparent: false,
          isHome: false),
      body: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: ScreenHelper.screenWidth(context, 22),
          vertical: ScreenHelper.screenHeight(context, 7),
        ),
        children: [
          SizedBox(
            height: ScreenHelper.screenHeight(context, 7),
          ),
          CustomText(
            text: "شروط الضمان ",
            fontW: FW.bold,
            fontSize: 20,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: ScreenHelper.screenHeight(context, 38),
          ),
          CustomTermsText(
            text: "_  هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة النص",
          ),
          SizedBox(
            height: ScreenHelper.screenHeight(context, 23),
          ),
          CustomTermsText(
            text: "_  هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة النص",
          ),
          SizedBox(
            height: ScreenHelper.screenHeight(context, 23),
          ),
          CustomTermsText(
            text: "_  هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة النص",
          ),
          SizedBox(
            height: ScreenHelper.screenHeight(context, 23),
          ),
          CustomTermsText(
            text: "_  هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة النص",
          ),
          SizedBox(
            height: ScreenHelper.screenHeight(context, 23),
          ),
          CustomTermsText(
            text: "_  هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة النص",
          ),
        ],
      ),
    );
  }
}
