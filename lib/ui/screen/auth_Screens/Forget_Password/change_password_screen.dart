import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lotus/Bloc/Controllers/Forget_Password/create_new_pass_provider.dart';
import 'package:lotus/helpers/screen_helper.dart';
import 'package:lotus/ui/widget/custom_button.dart';
import 'package:lotus/ui/widget/custom_dialog.dart';
import 'package:lotus/ui/widget/custom_text.dart';
import 'package:lotus/ui/widget/custom_text_field.dart';
import 'package:lotus/ui/widget/header.dart';
import 'package:lotus/utils/constants.dart';

import '../login_screen.dart';
import '../welcome_screen.dart';

class ChangePasswordScreen extends StatelessWidget {
  final CreateNewPassProvider _newPassProvider =
      Get.put(CreateNewPassProvider());
  final String phoneNumber;
  ChangePasswordScreen(this.phoneNumber);

  @override
  Widget build(BuildContext context) {
    var node = FocusScope.of(context);

    return Scaffold(
      body: Form(
        key: _newPassProvider.globalKey,
        child: ListView(
          children: [
            Header(),
            SizedBox(
              height: ScreenHelper.screenHeight(context, 50),
            ),
            CustomText(
              textAlign: TextAlign.center,
              text: "كلمه المرور الجديده",
              fontSize: ScreenHelper.screenFont(context, 25),
            ),
            CustomText(
              textAlign: TextAlign.center,
              text: "يمكنك الان كتابه كلمه السر الجديده",
              // fontSize: ScreenHelper.screenFont(context, 25),
            ),
            SizedBox(
              height: ScreenHelper.screenHeight(context, 40),
            ),
            GetX<CreateNewPassProvider>(
              builder: (controller) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: CustomTextField(
                  hint: "كلمة المرور الجديده",
                  suffixIcon: controller.passwordSecure.value
                      ? Icons.visibility_off
                      : Icons.visibility,
                  onSuffixTap: () {
                    controller.passwordSecure.value =
                        !controller.passwordSecure.value;
                  },
                  isSecure: controller.passwordSecure.value,
                  controller: controller.passwordController,
                  shortMessage: "يجب الا تقل كلمة المرور عن ستة احرف او ارقام",
                  shortCondition: 6,
                  errorMessage: "يجب ادخال كلمة السر",
//                          prefixIcon: "assets/img/person.png",
                  onComplete: () {
                    node.nextFocus();
                    // submit(); .............//////////////////
                  },
                ),
              ),
            ),
            SizedBox(
              height: ScreenHelper.screenHeight(context, 18),
            ),
            GetX<CreateNewPassProvider>(
              builder: (controller) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: CustomTextField(
                  hint: "تاكيد كلمة السر",
                  suffixIcon: controller.confirmPasswordSecure.value
                      ? Icons.visibility_off
                      : Icons.visibility,
                  onSuffixTap: () {
                    controller.confirmPasswordSecure.value =
                        !controller.confirmPasswordSecure.value;
                  },
                  isSecure: controller.confirmPasswordSecure.value,
                  controller: controller.confirmPasswordController,
                  validator: (String value) {
                    if (value.isEmpty) {
                      return "يجب ادخال كلمة السر";
                    } else if (value != controller.passwordController.text) {
                      return "كلمتان السر غير متطابقتان";
                    } else {
                      return null;
                    }
                  },
                  shortMessage: "يجب الا تقل كلمة المرور عن ستة احرف او ارقام",
                  shortCondition: 6,
                  errorMessage: "يجب ادخال كلمة السر",
//                          prefixIcon: "assets/img/person.png",
                  onComplete: () {
                    node.nextFocus();
                  },
                ),
              ),
            ),
            SizedBox(
              height: ScreenHelper.screenHeight(context, 50),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: SimpleCustomButton(
                text: "التالي",
                bgColor: ConstColors.GREEN_COLOR,
                onTap: () {
                  _newPassProvider
                      .createNewPass(phone: phoneNumber)
                      .then((value) {
                    if (value.status == true) {
                      Get.offAll(WelcomeScreen());

                      Get.dialog(OkDialog(
                        title: "${value.message}",
                        body: "يمكنك الان تجربه تسجيل الدخول",
                        image: "assets/img/cobone.png",
                        onTapOk: () {
                          Get.to(LoginScreen());
                        },
                      ));
                    } else {
                      Get.dialog(OkDialog(
                        title: "خطأ",
                        body: "يمكنك الان تجربه تسجيل الدخول",
                        image: "${value.message}",
                        buttonName: "تسجيل الدخول",

                        onTapOk: () {
                          Get.back();
                        },
                      ));
                    }
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
