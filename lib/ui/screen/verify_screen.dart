import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';
import 'package:get/get.dart';
import 'package:lotus/helpers/screen_helper.dart';
import 'package:lotus/ui/globalWidget/custom_loading.dart';
import 'package:lotus/ui/widget/custom_button.dart';
import 'package:lotus/utils/constants.dart';

import '../../ui/widget/header.dart';

class VerifyScreen extends StatefulWidget {
final  String phone;
final  Function onSuccess;
final String validationCode;
final User user;

  VerifyScreen(
      {this.phone, this.onSuccess, this.validationCode, this.user});

  @override
  _VerifyScreenState createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  TextEditingController _phoneController;
  bool passwordSecure = false;
  String code;
  bool onEditing = false;
  bool isFinished = false;
  Function onSuccess;
  bool isVerify = true;

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
//
                        phoneVerify(context),
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

  Widget phoneVerify(BuildContext context) {

    return VerificationCode(

      textStyle: Theme.of(context).textTheme.headline2.copyWith(
          fontSize: ScreenHelper.screenFont(context, 25),

          color: isVerify ? ConstColors.MAIN_COLOR : Colors.red),

      keyboardType: TextInputType.number,

      autofocus: true,

      length: 6,
      // clearAll is NOT required, you can delete it
      // takes any widget, so you can implement your design
      clearAll: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          'clear all',
          style: TextStyle(
              fontSize: 14.0,
              decoration: TextDecoration.underline,
              color: Colors.blue[700]),
        ),
      ),

      onCompleted: (String value) {
        setState(() {
          code = value;
        });
      },

      onEditing: (bool value) {
        setState(() {
          onEditing = value;
        });
      },

    );
  }

  void submit(BuildContext context) async {
    if (_globalKey.currentState.validate()) {
      _globalKey.currentState.save();

      // storedEmail = _emailController.text.trim();
      print('validate success');
      print('field1 is ${code}');

      setState(() {
        isVerify = false;
        isFinished = true;
      });

      Get.dialog(CustomLoading());

      try {
        await widget.onSuccess(widget.validationCode, code);
      } catch (e) {
        Get.back();
        print(e);
      }

      // TODO handel login method
    } else {}
  }
}




//
// return PinFieldAutoFill(
// // decoration: // UnderlineDecoration, BoxLooseDecoration or BoxTightDecoration see https://github.com/TinoGuo/pin_input_text_field for more info,
// currentCode: currentText ,// prefill with a code
// onCodeSubmitted: (String value) {
// setState(() {
// currentText = value;
// });
// },
// // onCodeChanged: (value) {
// //     setState(() {
// //       isVerify = value;
// //     });
// //   },
// // onCodeSubmitted: //code submitted callback
// // onCodeChanged: //code changed callback
// // codeLength: //code length, default 6
// );
