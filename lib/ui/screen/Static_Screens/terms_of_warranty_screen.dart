import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Bloc/Controllers/Terms_of_warranty_provider.dart';
import '../../../helpers/screen_helper.dart';
import '../../globalWidget/custom_loading.dart';
import '../../widget/custom_appBar.dart';
import '../../widget/custom_text.dart';

class TermsOfWarrantyScreen extends StatelessWidget {
  final TermsOfWarrantyProvider _provider = Get.put(TermsOfWarrantyProvider());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        context: context,
        onPressed: () {},
        transparent: false,
        isHome: false,
      ),
      body: GetX<TermsOfWarrantyProvider>(
        builder: (controller) => _provider.loading.value
            ? CustomLoading(bg: Colors.white)
            : ListView(
                padding: EdgeInsets.all(15),
                children: [
                  CustomText(
                    text: "شروط الضمان",
                    fontW: FW.bold,
                    fontSize: 20,
                    textAlign: TextAlign.center,
                    padding: EdgeInsets.only(bottom: 25, top: 25),
                  ),
                  CustomText(
                    padding: EdgeInsets.only(top: 67),
                    text: "${controller.text.value}",
                    fontSize: ScreenHelper.screenFont(context, 15),
                  ),
                ],
              ),
      ),
    );
  }
}
