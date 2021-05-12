import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Bloc/Controllers/Inspector/create_plumber_account_provider.dart';
import '../../../helpers/screen_helper.dart';
import '../../../utils/constants.dart';
import '../../globalWidget/custom_loading.dart';
import '../../globalWidget/custom_snack_bar.dart';
import '../../widget/custom_appBar.dart';
import '../../widget/custom_button.dart';
import '../../widget/custom_dialog.dart';
import '../../widget/custom_text.dart';
import '../../widget/custom_text_field.dart';
import '../Plumber/get_user_code_screen.dart';

class NewAccount extends StatelessWidget {
  final CreatePlumberAccountProvider _accountProvider =
      Get.put(CreatePlumberAccountProvider());
  final GlobalKey<FormState> desKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(isHome: false, context: context),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: ScreenHelper.screenWidth(context, 25),
          ),
          child: Form(
            key: desKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: ScreenHelper.screenHeight(context, 60)),
                CustomText(
                  text: 'حساب جديد',
                  fontSize: ScreenHelper.screenFont(context, 25),
                  fontW: FW.bold,
                ),
                SizedBox(height: ScreenHelper.screenHeight(context, 38)),
                CustomTextField(
                  hint: "اسم السباك",
                  controller: _accountProvider.nameController,
                  errorMessage: "يجب ادخال اسم السباك",
                  //  prefixIcon: "assets/img/person.png",
                ),
                SizedBox(height: ScreenHelper.screenHeight(context, 25)),
                CustomTextField(
                  hint: " رقم الموبيل",
                  controller: _accountProvider.phoneController,
                  errorMessage: "يجب ادخال رقم الهاتف",
                  //  prefixIcon: "assets/img/person.png",
                ),
                SizedBox(height: ScreenHelper.screenHeight(context, 30)),
                SimpleCustomButton(
                  width: ScreenHelper.screenSize(context).width,
                  onTap: () async {
                    if (!desKey.currentState.validate()) {
                    } else {
                      desKey.currentState.save();

                      Get.dialog(
                        CustomLoading(loadingText: 'جار انشاء حساب جديد...'),
                      );

                      await _accountProvider
                          .createPlumberAccount()
                          .then((value) {
                        Get.back();
                        Get.back();
                        if (value.status) {
                          Get.to(GetUserCodeScreen(value));
                          customSnackBar(
                              title: "حساب جديد",
                              body: "تم انشاء حساب سباك جديد");
                        } else {
                          Get.dialog(
                            OkDialog(
                              title: ' خطأ ',
                              image: 'assets/img/okicon.png',
                              body: '${value.message}',
                              onTapOk: () {
                                Get.back();
                              },
                            ),
                          );
                        }
                      });
                    }
                  },
                  text: 'حفظ',
                  bgColor: ConstColors.GREEN_COLOR,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
