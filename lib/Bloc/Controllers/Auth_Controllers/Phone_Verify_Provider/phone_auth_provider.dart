import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class PhoneVerifyPhoneProvider extends GetxController{
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // final _scaffoldKey = GlobalKey<ScaffoldState>();

  // final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _smsController = TextEditingController();
  RxString _verificationId= "".obs;

  Future verifyPhoneNumber(String phoneNumber) async {
    print("verifyPhoneNumber ??????");
    //Callback for when the user has already previously signed in with this phone number on this device
    PhoneVerificationCompleted verificationCompleted =
        (PhoneAuthCredential phoneAuthCredential) async {

      await _auth.signInWithCredential(phoneAuthCredential);

      print("Phone number automatically verified and user signed in: ${_auth.currentUser.uid}");
    };

    //Listens for errors with verification, such as too many attempts
    PhoneVerificationFailed verificationFailed =
        (FirebaseAuthException authException) {

      print('Phone number verification failed. Code: ${authException.code}. Message: ${authException.message}');
    };

//Callback for when the code is sent
    PhoneCodeSent codeSent =
        (String verificationId, [int forceResendingToken]) async {
       print('Please check your phone for the verification code.');
      _verificationId.value = verificationId;
    };


    PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout =
        (String verificationId) {
      print("verification code: " + verificationId);
      _verificationId.value = verificationId;
    };

    try {
      print("verify Phone Number ::: START");

      await _auth.verifyPhoneNumber(
        phoneNumber: "+20$phoneNumber",
        timeout: const Duration(seconds: 5),
        verificationCompleted: verificationCompleted,
        verificationFailed: verificationFailed,
        codeSent: codeSent,
        codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
      );

      return _verificationId;

    } catch (e) {
      // print("verify Phone Number ::: $e");
       print("Failed to Verify Phone Number: $e");
    }
  }



  void signInWithPhoneNumber() async {
    try {
      final AuthCredential credential = PhoneAuthProvider.credential(
        verificationId: _verificationId.value,
        smsCode: _smsController.text,
      );

      final User user = (await _auth.signInWithCredential(credential)).user;


       print("Successfully signed in UID: ${user.uid}");
    } catch (e) {
       print("Failed to sign in: " + e.toString());
    }
  }


}