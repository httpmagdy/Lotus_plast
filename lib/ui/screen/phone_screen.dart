import 'package:flutter/material.dart';
import 'package:lotus/helpers/screen_helper.dart';
import 'package:lotus/ui/widget/custom_button.dart';
import 'package:lotus/ui/widget/custom_phone_text_field.dart';
import 'package:lotus/utils/constants.dart';
import '../../ui/widget/header.dart';

class PhoneScreen extends StatefulWidget {
  @override
  _PhoneScreenState createState() => _PhoneScreenState();
}

class _PhoneScreenState extends State<PhoneScreen> {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  TextEditingController _phoneController;

  bool passwordSecure = false;

  //

  // KeyboardVisibilityNotification _keyboardVisibility =
  //     new KeyboardVisibilityNotification();
  // int _keyboardVisibilitySubscriberId;
  // bool _keyboardState = false;

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
                    key: _globalKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: ScreenHelper.screenHeight(context, 80),
                        ),
                        Text(
                          "ادخل رقم الموبايل",
                          style: Theme.of(context).textTheme.headline1.copyWith(
                              fontSize: ScreenHelper.screenFont(context, 25)),
                        ),
                        Text(
                          "من فضلك ادخل رقم موبايلك حتي يتم ارسال كود التاكيد وتاكيد حسابك",
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.subtitle2.copyWith(
                              fontSize: ScreenHelper.screenFont(context, 16)),
                        ),
                        SizedBox(
                          height: ScreenHelper.screenHeight(context, 50),
                        ),
                        CustomPhoneTextField(
                          hint: "رقم الهاتف",
                          controller: _phoneController,
                          errorMessage: "يجب ادخال رقم الهاتف",
//                          prefixIcon: "assets/img/person.png",
                          keyboardType: TextInputType.number,
                          onComplete: () {
                            node.nextFocus();
                          },
                        ),
                        SizedBox(
                          height: ScreenHelper.screenHeight(context, 50),
                        ),
                        CustomButton(
                          buttonColor: ConstColors.MAIN_COLOR,
                          onTap: () {},
                          title: "التالي",
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
}
