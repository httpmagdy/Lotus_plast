import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Bloc/Controllers/Auth_Controllers/login.dart';
import '../../../helpers/screen_helper.dart';
import '../../../utils/constants.dart';
import '../../widget/circle_button.dart';
import '../../widget/custom_text.dart';
import '../../widget/custom_text_field.dart';
import '../../widget/header.dart';
import 'Forget_Password/forget_password_scren.dart';
import 'signup_screen.dart';

class LoginScreen extends StatelessWidget {
  final LoginProvider _loginProvider = Get.put(LoginProvider());

  @override
  Widget build(BuildContext context) {
    var node = FocusScope.of(context);
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: SizedBox(
              height: ScreenHelper.screenSize(context).height,
              child: Column(
                children: [
                  Header(),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: ScreenHelper.screenWidth(context, 31)),
                    child: Form(
                      key: _loginProvider.globalKeyLoginn,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: ScreenHelper.screenHeight(context, 80),
                          ),
                          Text(
                            "تسجيل الدخول",
                            style: Theme.of(context)
                                .textTheme
                                .headline1
                                .copyWith(
                                    fontSize:
                                        ScreenHelper.screenFont(context, 25)),
                          ),
                          Text(
                            "ادخل رقم الموبايل وكلمة السر",
                            style: Theme.of(context)
                                .textTheme
                                .subtitle2
                                .copyWith(
                                    fontSize:
                                        ScreenHelper.screenFont(context, 16)),
                          ),
                          SizedBox(
                            height: ScreenHelper.screenHeight(context, 18),
                          ),
                          CustomTextField(
                            hint: "رقم الهاتف",
                            controller: _loginProvider.usernameController,
                            errorMessage: "يجب ادخال رقم الهاتف",
                            // shortMessage: "يجب ادخال رقم هاتف صحيح",
                            // validPhoneMessage: "يجب ادخال رقم هاتف صحيح",
                            keyboardType: TextInputType.phone,

                            onComplete: () {
                              node.nextFocus();
                            },
                          ),
                          SizedBox(
                            height: ScreenHelper.screenHeight(context, 26),
                          ),
                          GetX<LoginProvider>(
                            init: LoginProvider(),
                            builder: (controller) => CustomTextField(
                              hint: "كلمة المرور",

                              suffixIcon: controller.passwordSecure.value
                                  ? Icons.visibility_off
                                  : Icons.visibility,

                              onSuffixTap: () {
                                controller.passwordSecure.value =
                                    !controller.passwordSecure.value;
                              },

                              isSecure: controller.passwordSecure.value,
                              controller: controller.passwordController,
                              shortMessage:
                                  "يجب الا تقل كلمة المرور عن ستة احرف او ارقام",
                              shortCondition: 6,
                              errorMessage: "يجب ادخال كلمة السر",
//                          prefixIcon: "assets/img/person.png",
                              onComplete: () {
                                node.unfocus();
                                controller.login();
                              },
                            ),
                          ),
                          SizedBox(
                            height: ScreenHelper.screenHeight(context, 10),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(right: 10, bottom: 40),
                            child: InkWell(
                              onTap: () {
                                Get.to(ForgrtPasswordScreen());
                              },
                              child: CustomText(
                                  color: ConstColors.MAIN_COLOR,
                                  text: "هل نسيت كلمه السر !",
                                  fontSize:
                                      ScreenHelper.screenFont(context, 12)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        bottom: ScreenHelper.screenHeight(context, 20)),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: InkWell(
                          onTap: () {
                            Get.to(SignUpScreen());
                          },
                          child: RichText(
                            text: TextSpan(
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle2
                                  .copyWith(
                                      color: ConstColors.GREY_COLOR,
                                      fontSize:
                                          ScreenHelper.screenFont(context, 15)),
                              children: <TextSpan>[
                                TextSpan(
                                  text: 'ليس لديك حساب ؟  ',
                                ),
                                TextSpan(
                                  text: 'إنشاء حساب',
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle1
                                      .copyWith(
                                          color: ConstColors.MAIN_COLOR,
                                          fontSize: ScreenHelper.screenFont(
                                              context, 15)),
                                )
                              ],
                            ),
                          )),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: ScreenHelper.screenWidth(context, 25),
                vertical: ScreenHelper.screenHeight(context, 50)),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CircleButton(
                    onTap: () async {
                      node.unfocus();
                      await _loginProvider.login();
                      // Get.back();
                      // Get.back();
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
