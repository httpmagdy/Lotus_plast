import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../helpers/screen_helper.dart';
import '../../../utils/constants.dart';
import '../../widget/custom_button.dart';
import '../../widget/custom_text.dart';
import '../../widget/custom_text_field.dart';

class EditDataInfoPlumber extends StatelessWidget {
  final GlobalKey _globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: ScreenHelper.screenWidth(context, 25.0)),
          child: Form(
            key: _globalKey,
            child: Column(
              children: [
                SizedBox(height: ScreenHelper.screenHeight(context, 90)),
                CustomText(
                  fontSize: ScreenHelper.screenFont(context, 25),
                  text: "تعديل بيانات السباك",
                  fontW: FW.bold,
                ),
                SizedBox(height: ScreenHelper.screenHeight(context, 50)),
                CustomTextField(
                  hint: 'الاسم',
                  // errorMessage: "جب ادخال الاسم",
                ),
                SizedBox(height: ScreenHelper.screenHeight(context, 15)),
                CustomTextField(
                  hint: 'رقم الهاتف',
                ),
                SizedBox(height: ScreenHelper.screenHeight(context, 15)),
                CustomTextField(
                  hint: 'رقم اخر',
                ),
                SizedBox(height: ScreenHelper.screenHeight(context, 30.0)),
                SimpleCustomButton(
                  bgColor: ConstColors.GREEN_COLOR,
                  width: ScreenHelper.screenSize(context).width,
                  text: "حفظ",
                  onTap: () {
                    Get.back();
                    // customSnackBar(title: "تعديل", body: 'لم تقم بتعديل اي شيئ');
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
