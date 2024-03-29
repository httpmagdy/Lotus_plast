import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';
import 'package:get_storage/get_storage.dart';
import '../../models/user_info.dart';
import '../../../ui/screen/Customer/home_customer.dart';
import '../../../ui/screen/Inspector/home_inspector.dart';
import '../../../ui/screen/Plumber/home_screen.dart';
import '../../../ui/widget/custom_dialog.dart';

class AuthProvider {
  final GetStorage userInfoStorage = GetStorage();

  final GetStorage howToOpen = GetStorage();

  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  // RxString deviceToken = "".obs;

  Future<String> getDeviceToken() async {
    String _token = await _firebaseMessaging.getToken();

    // deviceToken.value = _token;
    // update();

    print("=======(device token)========> $_token");

    return _token;
  }

  getUserTypeVerified() async {
    var typeUser = await userInfoStorage.read("typeUser");

    print('typeUser Verified ::::: $typeUser');

    if (typeUser == 0) {
      Get.offAll(HomeScreenPlumber());
    } else if (typeUser == 1) {
      Get.offAll(HomeCustomer());
    } else if (typeUser == 2) {
      Get.offAll(HomeInspector());
    } else {}
  }

  void getUserType(int type, int isActivePhone) {
    print('dataResponse.typeUser ::::: $type');

    var phoneVerify = userInfoStorage.read("phoneVerify");

    print('isActive... $isActivePhone');
    print('phoneVerify... $phoneVerify');

    if (isActivePhone == 1 || phoneVerify == 1) {
      print('Verify Phone Successful... $isActivePhone');

      if (type == 0) {
        Get.offAll(HomeScreenPlumber());
      } else if (type == 1) {
        Get.offAll(HomeCustomer());
      } else if (type == 2) {
        Get.offAll(HomeInspector());
      } else {}
    } else {
      //TODO: //////////////////////////

      print('Is Not Active ::::: Please Verify your Phone... $isActivePhone');
    }
  }

  Future<void> saveUserInfoStorage({UserInfo userInfo}) async {
    print("SAVED DATA :::: userInfo ============================ SAVE");
    print(
        "SAVED DATA :::: ${userInfo.data.name} ============================ SAVE");

    await userInfoStorage.write('idUser', userInfo.data.id);
    await userInfoStorage.write('name', userInfo.data.name);
    await userInfoStorage.write('phone', userInfo.data.phone);
    await userInfoStorage.write('city', userInfo.data.city);
    await userInfoStorage.write('state', userInfo.data.state);
    await userInfoStorage.write(
        'identificationNumber', userInfo.data.identificationNumber);
    await userInfoStorage.write('phoneVerify', userInfo.data.phoneVerify);
    await userInfoStorage.write('typeUser', userInfo.typeUser);
    await userInfoStorage.write('code', userInfo.data.code);
    await userInfoStorage.write('apiToken', userInfo.data.apiToken);

    print('API TOKENNNNNNNNNNN >>>>>>>>>> $howToOpen');
  }

  Future<void> deleteUserInfoStorage() async {
    await userInfoStorage.remove('idUser');
    await userInfoStorage.remove('name');
    await userInfoStorage.remove('phone');
    await userInfoStorage.remove('city');
    await userInfoStorage.remove('state');
    await userInfoStorage.remove('identificationNumber');
    await userInfoStorage.remove('phoneVerify');
    await userInfoStorage.remove('typeUser');
    await userInfoStorage.remove('code');
    await userInfoStorage.remove('apiToken');
  }
}
