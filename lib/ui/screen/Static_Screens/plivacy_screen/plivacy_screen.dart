import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lotus/Bloc/Controllers/privacy_controller.dart';
import 'package:lotus/helpers/screen_helper.dart';
import 'package:lotus/ui/globalWidget/custom_loading.dart';
import 'package:lotus/ui/widget/custom_appBar.dart';
import 'package:lotus/ui/widget/custom_text.dart';

class PlivacyScreen extends StatelessWidget {
  final PrivacyProvider _privacyProvider = Get.put(PrivacyProvider());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
          context: context,
          onPressed: () {},
          transparent: false,
          isHome: false),
      body: GetX<PrivacyProvider>(
        builder: (controller) => _privacyProvider.loading.value
            ? CustomLoading(bg: Colors.white)
            : ListView(
                padding: EdgeInsets.all(15),
                children: [
                  CustomText(
                    padding: EdgeInsets.only(bottom: 25, top: 25),
                    text: "سياسية الخصوصية ",
                    fontW: FW.bold,
                    fontSize: 20,
                    textAlign: TextAlign.center,
                  ),
                  CustomText(
                    padding: EdgeInsets.only(top: 50),
                    text: "${controller.privacyText.value}",
                    fontSize: ScreenHelper.screenFont(context, 15),
                  ),
                ],
              ),
      ),
    );
  }
}
