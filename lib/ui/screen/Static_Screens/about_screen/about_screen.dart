import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../Bloc/Controllers/about_provider.dart';
import '../../../../helpers/screen_helper.dart';
import '../../../globalWidget/custom_loading.dart';
import '../../../widget/custom_appBar.dart';
import '../../../widget/custom_text.dart';

class AboutScreen extends StatelessWidget {
  final AboutProvider _aboutProvider = Get.put(AboutProvider());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        context: context,
        onPressed: () {},
        transparent: false,
        isHome: false,
      ),
      body: GetX<AboutProvider>(
        builder: (controller) => _aboutProvider.loading.value
            ? CustomLoading(bg: Colors.white)
            : ListView(
                padding: EdgeInsets.all(15),
                children: [
                  CustomText(
                    text: "عن التطبيق",
                    fontW: FW.bold,
                    fontSize: 20,
                    textAlign: TextAlign.center,
                    padding: EdgeInsets.only(bottom: 25, top: 25),
                  ),
                  SizedBox(
                    height: ScreenHelper.screenHeight(context, 16),
                  ),
                  Image.asset(
                    "assets/img/logo.png",
                    height: ScreenHelper.screenHeight(context, 100),
                    // width: ScreenHelper.screenWidth(context, 161),
                  ),
                  CustomText(
                    padding: EdgeInsets.only(top: 67),
                    text: "${controller.aboutText.value}",
                    fontSize: ScreenHelper.screenFont(context, 15),
                  ),
                ],
              ),
      ),
    );
  }
}
