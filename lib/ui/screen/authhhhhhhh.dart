// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:lotus/ui/screen/verify_screen.dart';
//
// class VerifyPhoneProvider extends GetxController {
//
//   Future<bool> rgisterUser({
//     BuildContext context,
//     User user,
//     Function onSuccess,
//   }) async {
//     var _auth = FirebaseAuth.instance;//
//     _auth.verifyPhoneNumber(
//       phoneNumber: user.phoneNumber,
//       timeout: Duration(seconds: 60),
//
//       verificationCompleted: (AuthCredential credential) async {
//         Navigator.of(context).pop();
//
//         UserCredential result = await _auth.signInWithCredential(credential);
//
//         var user = result.user;
//
//         if (user != null) {
//
//           onSuccess();
//
//           print("su");
//         } else {
//           print("Error");
//         }
//         //This callback would gets called when verification is done auto maticlly
//       },
//
//       verificationFailed: (var exception) {
//         print(exception);
//       },
//       codeSent: (String verificationId, [int forceResendingToken]) {
//         print("ode sent");
//
//         Get.offAll(
//             VerifyScreen(
//               phone: user.phoneNumber,
//               validationCode: verificationId,
//               user: user,
//               onSuccess: (String validationCode, String code) async {
//                 AuthCredential credential = PhoneAuthProvider.credential(
//                   verificationId: validationCode,
//                   smsCode: code,
//                 );
//
//                 UserCredential result =
//                     await _auth.signInWithCredential(credential);
//
//                 var user = result.user;
//
//                 if (user != null) {
//                   onSuccess();
//
//                   print("done awe");
//                 } else {
//                   print("Error");
//                 }
//               },
//             ),
//             transition: Transition.leftToRight,
//             curve: Curves.easeInOut);
//       },
//       codeAutoRetrievalTimeout: (data) {},
//     );
//   }
// }
