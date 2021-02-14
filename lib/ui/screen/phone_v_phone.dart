// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'dart:async';
// import 'package:flutter_verification_code/flutter_verification_code.dart';
//
//
// import '../../helpers/screen_helper.dart';
//
// class PhoneVerficationScreen extends StatefulWidget {
//   String phone;
//   Function onSuccess;
//   String validationCode;
//   User user;
//
//   PhoneVerficationScreen(
//       {this.phone, this.onSuccess, this.validationCode, this.user});
//
//   @override
//   _PhoneVerficationScreenState createState() => _PhoneVerficationScreenState();
// }
//
// class _PhoneVerficationScreenState extends State<PhoneVerficationScreen> {
//   // AuthController authController = Get.put(AuthController());
//   final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
//   TextEditingController _emailController;
//   String storedEmail = "";
//   bool isFinished = false;
//   bool keyboard = false;
//   String code;
//   bool onEditing = false;
//   bool isVerify = true;
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     _emailController = TextEditingController();
//   }
//
//   @override
//   void dispose() {
//     // TODO: implement dispose
//     _emailController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       top: false,
//         // backgroundColor: MAINCOLOR,
//         body: SingleChildScrollView(
//           child: Column(
//             textDirection: TextDirection.rtl,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: <Widget>[
//               Container(
//                 width: MediaQuery.of(context).size.width,
//                 height: ScreenHelper.screenHeight(context, 650),
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.only(
//                     bottomLeft:
//                     Radius.circular(ScreenHelper.screenRadius(context, 36)),
//                     bottomRight:
//                     Radius.circular(ScreenHelper.screenRadius(context, 36)),
//                   ),
//                   color: WHITECOLOR,
//                 ),
//                 child: Padding(
//                   padding: EdgeInsets.symmetric(
//                       horizontal: ScreenHelper.screenWidth(context, 16.0)),
//                   child: Stack(
//                     textDirection: TextDirection.rtl,
//                     alignment: Alignment.center,
//                     children: <Widget>[
//                       Form(
//                         key: _globalKey,
//                         child: Column(
//                           children: <Widget>[
//                             SizedBox(
//                               height: ScreenHelper.screenHeight(context, 50.0),
//                             ),
//                             Text(
//                               "ادخل رمز التأكيد",
//                               textDirection: TextDirection.rtl,
//                               style: Theme.of(context)
//                                   .textTheme
//                                   .headline2
//                                   .copyWith(
//                                 fontSize:
//                                 ScreenHelper.screenFont(context, 25),
//                               ),
//                             ),
//                             SizedBox(
//                               height: ScreenHelper.screenHeight(context, 33.0),
//                             ),
//                             Text(
//                               "تم ارسال كلمة السر الجديدة الي",
//                               textDirection: TextDirection.rtl,
//                               style: Theme.of(context)
//                                   .textTheme
//                                   .subtitle2
//                                   .copyWith(
//                                 fontSize:
//                                 ScreenHelper.screenFont(context, 15),
//                               ),
//                             ),
//                             SizedBox(
//                               height: ScreenHelper.screenHeight(context, 4.0),
//                             ),
//                             Text(
//                               widget.phone,
//                               textDirection: TextDirection.rtl,
//                               style: Theme.of(context)
//                                   .textTheme
//                                   .headline2
//                                   .copyWith(
//                                 fontSize:
//                                 ScreenHelper.screenFont(context, 15),
//                               ),
//                             ),
//                             SizedBox(
//                               height: ScreenHelper.screenHeight(context, 33.0),
//                             ),
//                             PhoneVerify(context),
//                             SizedBox(
//                               height: ScreenHelper.screenHeight(context, 40.0),
//                             ),
//                             Padding(
//                               padding: EdgeInsets.symmetric(
//                                   horizontal:
//                                   ScreenHelper.screenWidth(context, 40)),
//                               child: Text(
//                                 "رمز التأكيد يجعل تسجيلك اكثر سهولة ,كما يحافظ علي خصوصية معلوماتك",
//                                 textAlign: TextAlign.center,
//                                 textDirection: TextDirection.rtl,
//                                 style: Theme.of(context)
//                                     .textTheme
//                                     .subtitle2
//                                     .copyWith(
//                                   fontSize:
//                                   ScreenHelper.screenFont(context, 15),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       Padding(
//                         padding: EdgeInsets.only(
//                             bottom: ScreenHelper.screenHeight(
//                                 context, keyboard ? 300 : 37)),
//                         child: Align(
//                           alignment: Alignment.bottomCenter,
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: <Widget>[
//                               CircleButton(
//                                 isActive: true,
//                                 onPressed: () {
//                                   submit(context);
//                                 },
//                                 shadowColor: MAINCOLOR.withOpacity(.5),
//                                 blurRadius: 12,
//                                 spreadRadius: 1,
//                               ),
//                               InkWell(
//                                 child: Text(
//                                   "إعادة ارسال",
//                                   textDirection: TextDirection.rtl,
//                                   style: Theme.of(context)
//                                       .textTheme
//                                       .headline2
//                                       .copyWith(
//                                       fontSize: ScreenHelper.screenFont(
//                                           context, 16),
//                                       color: SECONDERYCOLOR),
//                                 ),
//                                 onTap: () async {
//                                   //  await authController.registerUser(context: context , user: widget.user );
//                                   print("اعادة ارسال");
//                                 },
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget PhoneVerify(BuildContext context) {
//     return VerificationCode(
//       textStyle: Theme.of(context).textTheme.headline2.copyWith(
//           fontSize: ScreenHelper.screenFont(context, 25),
//           color: isVerify ? MAINCOLOR : Colors.red),
//       keyboardType: TextInputType.number,
//       autofocus: true,
//       itemDecoration: BoxDecoration(
//           border: Border(
//               bottom: BorderSide(
//                   width: 2, color: isVerify ? MAINCOLOR : Colors.red))),
//       length: 6,
//       // clearAll is NOT required, you can delete it
//       // takes any widget, so you can implement your design
//       clearAll: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Text(
//           'clear all',
//           style: TextStyle(
//               fontSize: 14.0,
//               decoration: TextDecoration.underline,
//               color: Colors.blue[700]),
//         ),
//       ),
//       onCompleted: (String value) {
//         setState(() {
//           code = value;
//         });
//       },
//       onEditing: (bool value) {
//         setState(() {
//           onEditing = value;
//         });
//       },
//     );
//   }
//
//   void submit(BuildContext context) async {
//     if (_globalKey.currentState.validate()) {
//       _globalKey.currentState.save();
//       storedEmail = _emailController.text.trim();
//       print('validate success');
//       print('field1 is ${code}');
//       setState(() {
//         isVerify = false;
//         isFinished = true;
//       });
//       Get.dialog(LoadingDialog());
//       try {
//         await widget.onSuccess(widget.validationCode, code);
//       } catch (e) {
//         Get.back();
//         print(e);
//       }
//       // TODO handel login method
//     } else {}
//   }
// }