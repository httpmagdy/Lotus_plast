import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:lotus/Bloc/repository/verify_phone_repo.dart';
import 'package:lotus/Services/api_key.dart';
import 'package:lotus/ui/globalWidget/custom_loading.dart';
import 'package:lotus/ui/globalWidget/custom_snack_bar.dart';
import 'package:lotus/ui/widget/custom_dialog.dart';

import '../auth_provider.dart';

class PhoneVerifyPhoneProvider extends GetxController{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  AuthProvider _authProvider = AuthProvider();
  VerifyPhoneRepo _verifyPhoneRepo = VerifyPhoneRepo();

   TextEditingController smsController = TextEditingController();

  @override
  void onInit() {
    smsController = TextEditingController();
    super.onInit();
  }

  // @override
  // void onClose() {
  //
  //   smsController.dispose();
  //   super.onClose();
  // }
  // final _scaffoldKey = GlobalKey<ScaffoldState>();

  // final TextEditingController _phoneNumberController = TextEditingController();

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


      if(authException.code == "too-many-requests"){

        Get.dialog(OkDialog(title: "خطأ", body: "لقد حظرنا جميع الطلبات الواردة من هذا الجهاز بسبب نشاط غير عادي. حاول مرة أخرى في وقت لاحق.",onTapOk: (){
Get.back();
        },), );

      }

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


  Future verifyDonning() async {
    try {


      print(" smsController => ${smsController.text}");

      final AuthCredential credential = PhoneAuthProvider.credential(
        verificationId: _verificationId.value,
        smsCode: smsController.text,
      );


      print(":::::::::::::::::::::::::::: >>>>>>>>>>>>>>>>>> ${credential.token}");


        // Get.dialog(CustomLoading());


        final User user = (await _auth.signInWithCredential(credential)).user;




        if(user.uid == null){

          customSnackBar(title: "الرمز خاطئ",body:  "لرمز الذي ادخلته غير صحيح");

        }

        if(user.uid != null){

          print("Successfully signed in UID: ${user.uid}");
          _authProvider.getUserTypeVerified();
          _verifyPhoneRepo.verifyCodeRepo();


          // Get.back();

        }else{
          // Get.back();



        }



      print("Failed signed in UID==========: ${user.uid}");
      print("Failed signed in UID==========: ${user.uid}");

       // return user.uid;
      // Get.back();

    } catch (e) {


       print("Failed to sign in: " + e.toString());
       // print("Failed to sign in: " + user);
    }
  }


}