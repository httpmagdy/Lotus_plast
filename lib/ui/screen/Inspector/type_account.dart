import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Bloc/Controllers/Inspector/get_plumber_by_code.dart';
import '../../../helpers/screen_helper.dart';
import '../../../utils/constants.dart';
import '../../globalWidget/custom_loading.dart';
import '../../widget/custom_appBar.dart';
import '../../widget/custom_button.dart';
import '../../widget/custom_dialog.dart';
import '../../widget/custom_text.dart';
import '../../widget/custom_text_field.dart';
import '../Plumber/get_user_code_screen.dart';
import 'NewAccount.dart';

class TypeAccount extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(isHome: false, context: context),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: ScreenHelper.screenHeight(context, 110)),
            CustomText(
              text: 'اختار نوع الحساب',
              fontSize: ScreenHelper.screenFont(context, 25),
            ),
            SizedBox(height: ScreenHelper.screenHeight(context, 65)),
            SimpleCustomButton(
              width: ScreenHelper.screenWidth(context, 266),
              onTap: () {
                Get.dialog(DialogCodeUser());
              },
              text: 'حالي',
              bgColor: ConstColors.GREEN_COLOR,
            ),
            SizedBox(height: ScreenHelper.screenHeight(context, 35)),
            SimpleCustomButton(
              width: ScreenHelper.screenWidth(context, 266),
              outlineButton: true,
              onTap: () {
                Get.dialog(NewAccount());
              },
              text: 'جديد',
              bgColor: ConstColors.GREEN_COLOR,
            ),
            SizedBox(height: ScreenHelper.screenHeight(context, 25)),
          ],
        ),
      ),
    );
  }
}

class DialogCodeUser extends StatelessWidget {
  final GetPlumberByCodeProvider _getPlumberByCodeProvider =
      Get.put(GetPlumberByCodeProvider());
  final GlobalKey<FormState> desKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return DialogPoint(
      buttonWidth: ScreenHelper.screenWidth(context, 230),
      buttonName: 'حفظ',
      buttonColor: ConstColors.GREEN_COLOR,
      height: ScreenHelper.screenSize(context).height * .7,
      child: Column(
        children: [
          // SizedBox(height: ScreenHelper.screenHeight(context, 25)),
          Image.asset(
            'assets/img/QRR.png',
            width: ScreenHelper.screenHeight(context, 105),
            // height: 200,
          ),
          SizedBox(height: ScreenHelper.screenHeight(context, 20)),
          CustomText(
            text: 'قم بادخال كود السباك',
            fontSize: ScreenHelper.screenFont(context, 20),
          ),
          SizedBox(height: ScreenHelper.screenHeight(context, 30)),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: ScreenHelper.screenWidth(context, 25)),
            child: Form(
              key: desKey,
              child: CustomTextField(
                hint: "كود السباك",
                controller: _getPlumberByCodeProvider.codeController,
                errorMessage: "يجب ادخال كود السباك",
                //  prefixIcon: "assets/img/person.png",
              ),
            ),
          ),
          SizedBox(height: ScreenHelper.screenHeight(context, 30)),
        ],
      ),
      onTapOk: () async {
        if (!desKey.currentState.validate()) {
        } else {
          desKey.currentState.save();

          Get.dialog(
            CustomLoading(loadingText: 'جار اتمام المعاينه...'),
          );

          await _getPlumberByCodeProvider.plumberByCode().then((value) {
            Get.back();
            Get.back();
            if (value.status) {
              Get.to(GetUserCodeScreen(value));
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
    );
  }
}
