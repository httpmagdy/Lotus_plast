import 'dart:async';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lotus/Bloc/Controllers/Auth_Controllers/Phone_Verify_Provider/phone_auth_provider.dart';
import 'package:lotus/helpers/screen_helper.dart';
import 'package:lotus/ui/globalWidget/custom_loading.dart';
import 'package:lotus/ui/widget/custom_button.dart';
import 'package:lotus/ui/widget/custom_text.dart';
import 'package:lotus/ui/widget/header.dart';
import 'package:lotus/utils/constants.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class PhoneVerificationScreen extends StatefulWidget {
  final String phoneNumber;

  PhoneVerificationScreen(this.phoneNumber);

  @override
  _PhoneVerificationScreenState createState() =>
      _PhoneVerificationScreenState();
}

class _PhoneVerificationScreenState extends State<PhoneVerificationScreen> {
  var onTapRecognizer;
  PhoneVerifyPhoneProvider _verifyPhoneProvider =
      Get.put(PhoneVerifyPhoneProvider());

  // TextEditingController textEditingController = TextEditingController();

  // ..text = "123456";

  StreamController<ErrorAnimationType> errorController;

  bool hasError = false;
  String currentText = "";
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();
  TextEditingController smsController;

  @override
  void initState() {
    onTapRecognizer = TapGestureRecognizer()
      ..onTap = () {
        Navigator.pop(context);
      };
    errorController = StreamController<ErrorAnimationType>();
    smsController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    smsController.dispose();

    errorController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: ConstColors.WHITE,
      key: scaffoldKey,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          ListView(
            children: <Widget>[
              // SizedBox(height: 30),
              // Container(
              //   height: MediaQuery.of(context).size.height / 3,
              //   // child: FlareActor(
              //   //   "assets/otp.flr",
              //   //   animation: "otp",
              //   //   fit: BoxFit.fitHeight,
              //   //   alignment: Alignment.center,
              //   // ),
              // ),
              Header(),

              CustomText(
                textAlign: TextAlign.center,
                text: "ادخل رمز التأكيد",
                fontSize: ScreenHelper.screenFont(context, 25),
                fontW: FW.bold,
                padding: EdgeInsets.only(bottom: 10),
              ),

              CustomText(
                textAlign: TextAlign.center,
                text: "لقد ارسلنا الرمز الي رقم",
                fontSize: ScreenHelper.screenFont(context, 14),
                color: ConstColors.TEXT_GREY2,
              ),

              CustomText(
                textAlign: TextAlign.center,
                text: "${widget.phoneNumber}",
                fontSize: ScreenHelper.screenFont(context, 14),
                color: ConstColors.TEXT_GREY2,
                padding: EdgeInsets.only(bottom: 20),
              ),

              Directionality(
                textDirection: TextDirection.ltr,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 30,
                  ),
                  child: GetBuilder<PhoneVerifyPhoneProvider>(
                    init: PhoneVerifyPhoneProvider(),
                    builder: (controller) => Form(
                      key: formKey,
                      child: PinCodeTextField(
                        appContext: context,
                        pastedTextStyle: TextStyle(
                          color: Colors.green.shade600,
                          fontWeight: FontWeight.bold,
                        ),

                        length: 6,
                        obscureText: false,
                        obscuringCharacter: '*',
                        animationType: AnimationType.fade,
                        // validator: (v) {
                        //   if (v.length < 3) {
                        //     return "I'm from validator";
                        //   } else {
                        //     return null;
                        //   }
                        // },
                        pinTheme: PinTheme(
                          shape: PinCodeFieldShape.underline,
                          // borderRadius: BorderRadius.circular(5),
                          // fieldHeight: 60,
                          // fieldWidth: 50,
                          inactiveColor:
                              hasError ? Colors.red : ConstColors.GREY_COLOR,
                          // under line color
                          selectedColor: ConstColors.ORANGE_COLOR,
                          activeColor: ConstColors.GREEN_COLOR,
                          // disabledColor: Colors.yellow,
                          inactiveFillColor: ConstColors.WHITE,
                          selectedFillColor: ConstColors.WHITE,
                          activeFillColor: ConstColors.WHITE,
                        ),
                        autoFocus: true,

                        cursorColor: Colors.black,
                        animationDuration: Duration(milliseconds: 300),
                        textStyle: TextStyle(fontSize: 20, height: 1.6),
                        backgroundColor: ConstColors.WHITE,
                        enableActiveFill: true,
                        errorAnimationController: errorController,
                        controller: smsController,
                        keyboardType: TextInputType.number,
                        // boxShadows: [
                        //   BoxShadow(
                        //     offset: Offset(0, 1),
                        //     color: Colors.black12,
                        //     blurRadius: 10,
                        //   )
                        // ],
                        onCompleted: (v) {
                          print("Completed");
                        },
                        // onTap: () {
                        //   print("Pressed");
                        // },
                        onChanged: (value) {
                          print(value);
                          setState(() {
                            currentText = value;
                          });
                        },
                        beforeTextPaste: (text) {
                          print("Allowing to paste $text");
                          //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                          //but you can show anything you want here, like your pop up saying wrong paste format or etc
                          return true;
                        },
                      ),
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: CustomText(
                  text: hasError ? "*يجب ادخال رمز التأكيد للإستمرار" : "",
                  color: Colors.red,
                  fontSize: 10,
                ),
              ),

              SizedBox(
                height: 15,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  FlatButton(
                    child: CustomText(
                      text: "مسح",
                      fontW: FW.bold,
                    ),
                    onPressed: () {
                      smsController.clear();
                    },
                  ),
                  // FlatButton(
                  //   child: CustomText(
                  //     text: "لصق",
                  //     fontW: FW.bold,
                  //   ),
                  //   onPressed: () {
                  //     _verifyPhoneProvider.smsController.text = "123456";
                  //   },
                  // ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: SimpleCustomButton(
              width: ScreenHelper.screenSize(context).width,
              bgColor: ConstColors.GREEN_COLOR,
              text: "التالي",
              onTap: () async {
                if (!formKey.currentState.validate()) {
                } else {
                  // formKey.currentState.save();
                  print("SMS typing => ${smsController.text}");

                  if (currentText.length != 6) {
                    errorController.add(
                      ErrorAnimationType.shake,
                    ); // Triggering error shake animation

                    setState(() {
                      hasError = true;
                    });
                  } else {
                    setState(() {
                      hasError = false;
                    });



                    await _verifyPhoneProvider
                        .verifyDonning(smsController.text);



                    // Get.back();

                  }
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
