import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../Bloc/Controllers/Forget_Password/Verify_Password_provider.dart';
import '../../../../Bloc/Controllers/Forget_Password/check_phone_provider.dart';
import '../../../../helpers/screen_helper.dart';
import '../../../../utils/constants.dart';
import '../../../globalWidget/custom_snack_bar.dart';
import '../../../widget/custom_button.dart';
import '../../../widget/custom_text.dart';
import '../../../widget/custom_text_field.dart';
import '../../../widget/header.dart';

class ForgrtPasswordScreen extends StatefulWidget {
  @override
  _ForgrtPasswordScreenState createState() => _ForgrtPasswordScreenState();
}

class _ForgrtPasswordScreenState extends State<ForgrtPasswordScreen> {
  final VerifyPasswordByPhoneProvider _verifyPassword =
      Get.put(VerifyPasswordByPhoneProvider());

  final PhonechecProvider _phonecheck = Get.put(PhonechecProvider());
  final keyForm = GlobalKey<FormState>();

  TextEditingController phoneController;

  @override
  void initState() {
    phoneController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Header(),
          SizedBox(
            height: ScreenHelper.screenHeight(context, 50),
          ),
          CustomText(
            textAlign: TextAlign.center,
            text: "استرجاع كلمه السر",
            fontSize: ScreenHelper.screenFont(context, 25),
          ),
          CustomText(
            textAlign: TextAlign.center,
            text: "من فضلك ادخل رقم موبايلك ليتم التحقق منه",
            // fontSize: ScreenHelper.screenFont(context, 25),
          ),
          SizedBox(
            height: ScreenHelper.screenHeight(context, 40),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Form(
              key: keyForm,
              child: CustomTextField(
                hint: "رقم الموبايل",
                errorMessage: "يجب ادخال رقم الموبايل",
                shortCondition: 11,
                // shortMessage: "يجب ادخال رقم هاتف صحيح",
                // validPhoneMessage: "يجب ادخال رقم هاتف صحيح",
                controller: phoneController,
                keyboardType: TextInputType.phone,
                onComplete: () {
                  // node.nextFocus();
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
              onTap: () async {
                if (keyForm.currentState.validate()) {
                  keyForm.currentState.save();
                  await _phonecheck.phonechec(phone: phoneController.text).then(
                    (value) async {
                      print("::::::::::::::::::::::::: ${value.message}");
                      if (value.status == true) {
                        await _verifyPassword
                            .verifyPhoneNumber(phoneController.text);
                      } else {
                        Get.back();
                        customSnackBar(title: "غير موجود", body: value.message);
                      }
                    },
                  );
                } else {}

                // _verifyPassword.verifyPhoneNumber(phoneController.text);
              },
            ),
          ),
        ],
      ),
    );
  }
}
