import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:lotus/ui/globalWidget/custom_snack_bar.dart';
import 'package:lotus/ui/screen/auth_Screens/Forget_Password/change_password_screen.dart';
import 'package:lotus/ui/screen/auth_Screens/Forget_Password/verify_password_screem.dart';
import 'package:lotus/ui/widget/custom_dialog.dart';

class VerifyPasswordByPhoneProvider extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  // AuthProvider _authProvider = AuthProvider();
  // VerifyPhoneRepo _verifyPhoneRepo = VerifyPhoneRepo();

  RxString _verificationId = "".obs;

  RxString phoneNumberProv = "".obs;

  Future verifyPhoneNumber(String phoneNumber) async {
    print("verifyPhoneNumber ?????? $phoneNumber :::");
    phoneNumberProv.value = phoneNumber;
    //Callback for when the user has already previously signed in with this phone number on this device
    PhoneVerificationCompleted verificationCompleted =
        (PhoneAuthCredential phoneAuthCredential) async {
      await _auth.signInWithCredential(phoneAuthCredential);

      print(
          "Phone number automatically verified and user signed in: ${_auth.currentUser.uid}");
    };

    //Listens for errors with verification, such as too many attempts
    PhoneVerificationFailed verificationFailed =
        (FirebaseAuthException authException) {
      print(
          'Phone number verification failed. Code: ${authException.code}. Message: ${authException.message}');

      if (authException.code == "too-many-requests") {
        Get.dialog(
          OkDialog(
            title: "خطأ",
            body:
                "لقد حظرنا جميع الطلبات الواردة من هذا الجهاز \n بسبب نشاط غير عادي, حاول مرة أخرى في وقت لاحق.",
            image: "assets/img/cobone.png",
            onTapOk: () {
              Get.back();
              Get.back();
            },
          ),
        );
      }
    };

    //Callback for when the code is sent
    PhoneCodeSent codeSent =
        (String verificationId, [int forceResendingToken]) async {
      print('Please check your phone for the verification code.');
      _verificationId.value = verificationId;
      Get.back();

      Get.to(VerifyPasswordScreen(phoneNumber));
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

  Future verifyDonning(sms) async {
    try {
      print(" smsController => ${sms}");

      final AuthCredential credential = PhoneAuthProvider.credential(
        verificationId: _verificationId.value,
        smsCode: sms,
      );

      signIn(credential);
    } catch (e) {
      print("Failed credential: " + e.toString());
    }
  }

  //SignIn
  signIn(AuthCredential credential) async {
    final UserCredential authResult =
        await _auth.signInWithCredential(credential).catchError((onError) {
      customSnackBar(
          title: "خطأ", body: "حدث خطأ غير متوقع", errorMessage: true);
      print('SignIn Error: ${onError.toString()}\n\n');
    });

    if (authResult != null) {
      print("Successfully signed in UID: $credential");

      // await _verifyPhoneRepo.verifyCodeRepo();
      // await _authProvider.getUserTypeVerified();

      Get.to(ChangePasswordScreen(phoneNumberProv.value));

      // customSnackBar(title: "نجحت العملبه", body: "تم التأكيد بنجاح");
    } else {
      customSnackBar(
        title: "خطأ",
        body: "رجاء تأكد من ادخال الرمز المرسل لك",
        errorMessage: true,
      );
    }
  }
}
