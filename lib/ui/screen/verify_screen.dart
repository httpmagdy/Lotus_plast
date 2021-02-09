import 'package:flutter/material.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';
import 'package:lotus/helpers/screen_helper.dart';
import 'package:lotus/ui/widget/custom_button.dart';
import 'package:lotus/utils/constants.dart';

import '../../ui/widget/header.dart';

class VerifyScreen extends StatefulWidget {
  @override
  _VerifyScreenState createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  TextEditingController _phoneController;
  bool passwordSecure = false;
  String currentText;
  bool isVerify = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _phoneController = TextEditingController();

    // _keyboardVisibilitySubscriberId = _keyboardVisibility.addNewListener(
    //   onChange: (bool visible) {
    //     setState(() {
    //       _keyboardState = visible;
    //       print("gggggggggggggggggggggggggg ${_keyboardState}");
    //     });
    //   },
    // );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _phoneController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // var node = FocusScope.of(context);
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
                    key: _globalKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: ScreenHelper.screenHeight(context, 80),
                        ),
                        Text(
                          "ادخل رمز التأكيد",
                          style: Theme.of(context).textTheme.headline1.copyWith(
                              fontSize: ScreenHelper.screenFont(context, 25)),
                        ),
                        Text(
                          "لقد ارسلنا الرمز الي رقم",
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.subtitle2.copyWith(
                              fontSize: ScreenHelper.screenFont(context, 16)),
                        ),
                        Text(
                          "+200122000000",
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.subtitle2.copyWith(
                              fontSize: ScreenHelper.screenFont(context, 16)),
                        ),
                        SizedBox(
                          height: ScreenHelper.screenHeight(context, 50),
                        ),
//                        PinCodeTextField(
//                          length: 6,
//                          obscureText: true,
//                          animationType: AnimationType.fade,
//                          pinTheme: PinTheme(
//                            shape: PinCodeFieldShape.box,
//                            borderRadius: BorderRadius.circular(5),
//                            fieldHeight: 50,
//                            fieldWidth: 40,
//                            activeFillColor: Colors.white,
//                          ),
//                          animationDuration: Duration(milliseconds: 300),
//                          backgroundColor: Colors.blue.shade50,
//                          enableActiveFill: true,
////                          errorAnimationController: errorController,
////                          controller: textEditingController,
//                          onCompleted: (v) {
//                            print("Completed");
//                          },
//                          onChanged: (value) {
//                            print(value);
//                            setState(() {
//                              currentText = value;
//                            });
//                          },
//                          beforeTextPaste: (text) {
//                            print("Allowing to paste $text");
//                            //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
//                            //but you can show anything you want here, like your pop up saying wrong paste format or etc
//                            return true;
//                          },
//                        ),
                        PhoneVerify(context),
                        SizedBox(
                          height: ScreenHelper.screenHeight(context, 50),
                        ),
                        SimpleCustomButton(
                          // buttonColor: ConstColors.MAIN_COLOR,
                          bgColor: ConstColors.MAIN_COLOR,
                          onTap: () {},
                          text: "التالي",
                        ),
                        SizedBox(
                          height: ScreenHelper.screenHeight(context, 50),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void submit() {
    if (_globalKey.currentState.validate()) {
      _globalKey.currentState.save();

      print("user name or phonr is >> ${_phoneController.text}");
    }
  }

  Widget PhoneVerify(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: VerificationCode(
        autofocus: true,
        textStyle: Theme.of(context).textTheme.headline1.copyWith(
            fontSize: ScreenHelper.screenFont(context, 25),
            color: isVerify ? ConstColors.BLACK_COLOR : ConstColors.MAIN_COLOR),
//      keyboardType: TextInputType.number,
//      itemDecoration: BoxDecoration(
//          border: Border(
//              bottom: BorderSide(
//                  width: 2, color: isVerify ? ConstColors.MAIN_COLOR : Colors.red))),
        length: 6,
        underlineColor: ConstColors.MAIN_COLOR,
        itemSize: ScreenHelper.screenWidth(context, 45),

        // clearAll is NOT required, you can delete it
        // takes any widget, so you can implement your design
        clearAll: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'clear all',
            style: TextStyle(
                fontSize: 14.0,
                decoration: TextDecoration.underline,
                color: Colors.blue[100],
            ),
          ),
        ),
        onCompleted: (String value) {
          setState(() {
            currentText = value;
          });
        },
        onEditing: (bool value) {
          setState(() {
            isVerify = value;
          });
        },
      ),
    );
  }
}
