import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Bloc/Controllers/Auth_Controllers/Phone_Verify_Provider/phone_auth_provider.dart';
import '../auth_Screens/vreify_phone_screen.dart';
import '../../../Bloc/Controllers/Auth_Controllers/register.dart';
import '../../../Bloc/Controllers/get_status.dart';
import '../../../helpers/screen_helper.dart';
import '../../widget/circle_button.dart';
import '../../widget/custom_text_field.dart';
import '../../widget/state_area.dart';
import '../../../utils/constants.dart';
import '../../widget/header.dart';
import 'login_screen.dart';

class UserType {
  int id;
  String title;

  UserType({this.id, this.title});
}

List<UserType> types = [
  UserType(
    id: 0,
    title: "سباك",
  ),
  UserType(
    id: 1,
    title: "عميل",
  ),
];

class SignUpScreen extends StatelessWidget {
  final RegisterProvider _registerProvider = Get.put(RegisterProvider());
  final StatusProvider _statusProvider = Get.put(StatusProvider());
  // final PhoneVerifyPhoneProvider _verifyPhoneProvider =
  //     Get.put(PhoneVerifyPhoneProvider());

  @override
  Widget build(BuildContext context) {
    var node = FocusScope.of(context);
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Header(),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: ScreenHelper.screenWidth(context, 31)),
                  child: Form(
                    key: _registerProvider.globalKeyRegister,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: ScreenHelper.screenHeight(context, 35),
                        ),
                        Text(
                          "حساب جديد",
                          style: Theme.of(context).textTheme.headline1.copyWith(
                              fontSize: ScreenHelper.screenFont(context, 25)),
                        ),
                        SizedBox(
                          height: ScreenHelper.screenHeight(context, 18),
                        ),
                        CustomTextField(
                          hint: "اسم المستخدم",
                          errorMessage: "يجب ادخال اسم المستخمدم",
                          controller: _registerProvider.nameController,
                          onComplete: () {
                            node.nextFocus();
                          },
                        ),
                        SizedBox(
                          height: ScreenHelper.screenHeight(context, 18),
                        ),
                        CustomTextField(
                          hint: "رقم الموبايل",
                          errorMessage: "يجب ادخال رقم الموبايل",
                          shortCondition: 11,
                          shortMessage: "يجب ادخال رقم هاتف صحيح",
                          validPhoneMessage: "يجب ادخال رقم هاتف صحيح",
                          controller: _registerProvider.phoneController,
                          keyboardType: TextInputType.phone,
                          onComplete: () {
                            node.nextFocus();
                          },
                        ),
                        SizedBox(
                          height: ScreenHelper.screenHeight(context, 18),
                        ),
                        GetX<RegisterProvider>(
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
                              node.nextFocus();
                              // submit(); .............//////////////////
                            },
                          ),
                        ),
                        SizedBox(
                          height: ScreenHelper.screenHeight(context, 18),
                        ),
                        GetX<RegisterProvider>(
                          builder: (controller) => CustomTextField(
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
                              } else if (value !=
                                  controller.passwordController.text) {
                                return "كلمتان السر غير متطابقتان";
                              } else {
                                return null;
                              }
                            },
                            shortMessage:
                                "يجب الا تقل كلمة المرور عن ستة احرف او ارقام",
                            shortCondition: 6,
                            errorMessage: "يجب ادخال كلمة السر",
//                          prefixIcon: "assets/img/person.png",
                            onComplete: () {
                              node.nextFocus();
                            },
                          ),
                        ),
                        SizedBox(
                          height: ScreenHelper.screenHeight(context, 18),
                        ),

                        StateArea(),

                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //   children: [
                        //     SizedBox(
                        //       width: ScreenHelper.screenWidth(context, 140),
                        //       child: CustomTextField(
                        //         hint: "المحافظة",
                        //         controller: _registerProvider.stateController,
                        //         onComplete: () {
                        //           node.unfocus();
                        //         },
                        //       ),
                        //     ),
                        //     SizedBox(
                        //       width: ScreenHelper.screenWidth(context, 140),
                        //       child: CustomTextField(
                        //         hint: "المدينة",
                        //         controller: _registerProvider.cityController,
                        //         onComplete: () {
                        //           node.unfocus();
                        //         },
                        //       ),
                        //     ),
                        //   ],
                        // ),
                        SizedBox(
                          height: ScreenHelper.screenHeight(context, 25),
                        ),
                        GetX(
                          builder: (controller) => Row(
                            children: [
                              Row(
                                children: [
                                  Radio(
                                    groupValue: _registerProvider.typeId.value,
                                    value: types[0].id,
                                    onChanged: (value) {
                                      _registerProvider.typeId.value =
                                          types[0].id;
                                      print(
                                          'VALUE 1 :::: ${_registerProvider.typeId.value}');
                                    },
                                    activeColor: ConstColors.ORANGE_COLOR,
                                  ),
                                  // SizedBox(
                                  //   width: ScreenHelper.screenWidth(context, 0),
                                  // ),
                                  Image(
                                    image: AssetImage("assets/img/blumber.png"),
                                    width:
                                        ScreenHelper.screenWidth(context, 20),
                                    height:
                                        ScreenHelper.screenWidth(context, 20),
                                    color: _registerProvider.typeId.value == 0
                                        ? ConstColors.ORANGE_COLOR
                                        : ConstColors.FORM_COLOR,
                                  ),
                                  SizedBox(
                                    width:
                                        ScreenHelper.screenWidth(context, 10),
                                  ),
                                  Text(
                                    types[0].title,
                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle2
                                        .copyWith(
                                          color:
                                              _registerProvider.typeId.value ==
                                                      0
                                                  ? ConstColors.ORANGE_COLOR
                                                  : ConstColors.FORM_COLOR,
                                          fontSize: ScreenHelper.screenFont(
                                              context, 20),
                                        ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                  width: ScreenHelper.screenWidth(context, 15)),
                              Row(
                                children: [
                                  Radio(
                                    groupValue: _registerProvider.typeId.value,
                                    value: types[1].id,
                                    onChanged: (value) {
                                      _registerProvider.typeId.value =
                                          types[1].id;
                                      print(
                                          'VALUE 2:::: ${_registerProvider.typeId.value}');
                                    },
                                    activeColor: ConstColors.ORANGE_COLOR,
                                  ),
                                  SizedBox(
                                    width: ScreenHelper.screenWidth(context, 1),
                                  ),
                                  Image(
                                    image:
                                        AssetImage("assets/img/customer.png"),
                                    width:
                                        ScreenHelper.screenWidth(context, 20),
                                    height:
                                        ScreenHelper.screenWidth(context, 20),
                                    color: _registerProvider.typeId.value == 1
                                        ? ConstColors.ORANGE_COLOR
                                        : ConstColors.FORM_COLOR,
                                  ),
                                  SizedBox(
                                    width:
                                        ScreenHelper.screenWidth(context, 10),
                                  ),
                                  Text(
                                    types[1].title,
                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle2
                                        .copyWith(
                                          color:
                                              _registerProvider.typeId.value ==
                                                      1
                                                  ? ConstColors.ORANGE_COLOR
                                                  : ConstColors.FORM_COLOR,
                                          fontSize: ScreenHelper.screenFont(
                                              context, 20),
                                        ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: ScreenHelper.screenHeight(context, 25),
                        ),

                        CustomTextField(
                          hint: "رقم البطاقة",
                          controller:
                              _registerProvider.identificationController,
                          onComplete: () {
                            node.unfocus();
                          },
                        ),

                        SizedBox(
                          height: ScreenHelper.screenHeight(context, 100),
                        ),
                        Center(
                          child: InkWell(
                              onTap: () {
                                Get.to(LoginScreen());
                              },
                              child: RichText(
                                text: TextSpan(
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle2
                                      .copyWith(
                                          color: ConstColors.GREY_COLOR,
                                          fontSize: ScreenHelper.screenFont(
                                              context, 15)),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: 'لديك حساب ؟  ',
                                    ),
                                    TextSpan(
                                      text: 'تسجيل الدخول',
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
                        SizedBox(
                          height: ScreenHelper.screenHeight(context, 35),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
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
                  GetBuilder<PhoneVerifyPhoneProvider>(
                    init: PhoneVerifyPhoneProvider(),
                    // dispose: (state) {
                    //   PhoneVerifyPhoneProvider().smsController.dispose();
                    // },
                    builder: (controller) => CircleButton(
                      onTap: () async {
                        node.unfocus();

                        await _registerProvider.register().then((value) {
                          if (value != null) {
                            print("MAKE => Verify !!!");

                            controller
                                .verifyPhoneNumber(
                                    _registerProvider.phoneController.text)
                                .then((val) {
                              print("VALue => Id :::: $val");

                              if (val != null) {
                                print("SEND Code Is Done !!!");
                                Get.back();

                                Get.to(PhoneVerificationScreen(
                                    "${_registerProvider.phoneController.text}"));
                              }
                            });
                          } else {
                            print("NOT => Sign Up !!!");
                          }
                        });
                      },
                    ),
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
