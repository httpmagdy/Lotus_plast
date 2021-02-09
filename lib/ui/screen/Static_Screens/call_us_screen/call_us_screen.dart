import 'package:flutter/material.dart';
import 'package:lotus/helpers/screen_helper.dart';
import 'package:lotus/ui/widget/custom_appBar.dart';
import 'package:lotus/ui/widget/custom_button.dart';
import 'package:lotus/ui/widget/custom_text.dart';
import 'package:lotus/ui/widget/custom_text_field.dart';

class CallUs extends StatefulWidget {
  @override
  _CallUsState createState() => _CallUsState();
}

class _CallUsState extends State<CallUs> {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  TextEditingController _phoneController;

  TextEditingController _passwordController;

  bool passwordSecure = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _passwordController = TextEditingController();
    _phoneController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _passwordController.dispose();
    _phoneController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          customAppBar(context: context, onPressed: () {}, transparent: false,isHome: false),
      body:  SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25,),
          child: Column(

            children: [
              SizedBox(height: ScreenHelper.screenHeight(context,15),),
              CustomText(text: "اتصل بنا", fontW: FW.bold,fontSize: 20,),
              SizedBox(height: ScreenHelper.screenHeight(context,15),),

              Image.asset(
                "assets/img/MaskGroup1384.png",
                height: ScreenHelper.screenHeight(context, 185),
                // width: ScreenHelper.screenWidth(context, 303),
              ),
              SizedBox(height: ScreenHelper.screenHeight(context,26),),
              CustomTextField(
                prefixIcon: "assets/img/icons/prof.png",
                hint: "اسم المستخدم",
                controller: _phoneController,
              ),
              SizedBox(height: ScreenHelper.screenHeight(context,30),),
              CustomTextField(
                prefixIcon: "assets/img/icons/phone-line(1).png",
                hint: " رقم الموبيل",
                controller: _phoneController,

              ),
              SizedBox(height: ScreenHelper.screenHeight(context,30),),
              CustomTextField(
                verticalPadding: 16,
                horizentalPadding: 14,
                hint: "اكتب رسالتك",
                controller: _phoneController,
                maxLines: 5,
              ),
              SizedBox(height: ScreenHelper.screenHeight(context,30),),

              SimpleCustomButton(
                width: ScreenHelper.screenSize(context).width,
                onTap: (){

                },
                text: 'ارسال',
              ),
              SizedBox(height: ScreenHelper.screenHeight(context,15),),

            ],
          ),
        ),
      ),
    );
  }
}
