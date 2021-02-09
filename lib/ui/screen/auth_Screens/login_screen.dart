import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lotus/Bloc/Controllers/Auth_Controllers/login.dart';
import 'package:lotus/helpers/screen_helper.dart';
import 'package:lotus/ui/globalWidget/custom_loading.dart';
import 'package:lotus/ui/widget/circle_button.dart';
import 'package:lotus/ui/widget/custom_text_field.dart';
import 'package:lotus/utils/constants.dart';
import '../../widget/header.dart';
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
                      key: _loginProvider.globalKeyLogin,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: ScreenHelper.screenHeight(context, 80),
                          ),
                          Text(
                            "تسجيل الدخول",
                            style: Theme.of(context).textTheme.headline1.copyWith(
                                fontSize: ScreenHelper.screenFont(context, 25)),
                          ),
                          Text(
                            "ادخل رقم الموبايل وكلمة السر",
                            style: Theme.of(context).textTheme.subtitle2.copyWith(
                                fontSize: ScreenHelper.screenFont(context, 16)),
                          ),
                          SizedBox(
                            height: ScreenHelper.screenHeight(context, 18),
                          ),
                          CustomTextField(
                            hint: "اسم المستخدم او رقم الهاتف",
                            controller: _loginProvider.usernameController,
                            errorMessage: "يجب ادخال اسم المستخدم او رقم الهاتف",
//                          prefixIcon: "assets/img/person.png",
                            onComplete: () {
                              node.nextFocus();
                            },
                          ),
                          SizedBox(
                            height: ScreenHelper.screenHeight(context, 26),
                          ),
                          CustomTextField(
                            hint: "كلمة المرور",
                            suffixIcon: _loginProvider.passwordSecure.value
                                ? Icons.visibility_off
                                : Icons.visibility,
                            onSuffixTap: () {
                              _loginProvider.passwordSecure.value =  !_loginProvider.passwordSecure.value;
                            },
                            isSecure: _loginProvider.passwordSecure.value,
                            controller: _loginProvider.passwordController,
                            shortMessage:
                                "يجب الا تقل كلمة المرور عن ستة احرف او ارقام",
                            shortCondition: 6,
                            errorMessage: "يجب ادخال كلمة السر",
//                          prefixIcon: "assets/img/person.png",
                            onComplete: () {
                              node.unfocus();
                              _loginProvider.login();
                            },
                          ),
                          SizedBox(
                            height: ScreenHelper.screenHeight(context, 25),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                    EdgeInsets.only(bottom: ScreenHelper.screenHeight(context, 20)),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: InkWell(
                          onTap: () {
                            Get.to(SignUpScreen());
                          },
                          child: RichText(
                            text: TextSpan(
                              style: Theme.of(context).textTheme.subtitle2.copyWith(
                                  color: ConstColors.GREY_COLOR,
                                  fontSize: ScreenHelper.screenFont(context, 15)),
                              children: <TextSpan>[
                                TextSpan(
                                  text: 'ليس لديك حساب ؟  ',
                                ),
                                TextSpan(
                                  text: 'إنشاء حساب',
                                  style: Theme.of(context).textTheme.subtitle1.copyWith(
                                      color: ConstColors.MAIN_COLOR,
                                      fontSize: ScreenHelper.screenFont(context, 15)),
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
                    onTap: () async{
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
