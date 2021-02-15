import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:lotus/Bloc/models/user_info.dart';
import 'package:lotus/ui/screen/Customer/home_customer.dart';
import 'package:lotus/ui/screen/Inspector/home_inspector.dart';
import 'package:lotus/ui/screen/Plumber/home_screen.dart';

class AuthProvider{

  final GetStorage userInfoStorage = GetStorage();

  final GetStorage howToOpen = GetStorage();

  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();


  // RxString deviceToken = "".obs;

  Future<String> getDeviceToken()async{

    String _token = await _firebaseMessaging.getToken();

    // deviceToken.value = _token;
    // update();

    print("=======(device token)========> $_token");

    return _token;

  }


  getUserTypeVerified(){

    var  typeUser = userInfoStorage.read("typeUser");

    print('typeUser Verified ::::: $typeUser');


    if(typeUser == 0){
      Get.offAll(HomeScreenPlumber());
    }else if(typeUser == 1){
      Get.offAll(HomeCustomer());
    }else if(typeUser == 2){
      Get.offAll(HomeInspector());

    }else{

    }

  }

  void getUserType(int type, int isActive){

    print('dataResponse.typeUser ::::: ${type}');

    print('isActive... $isActive');

    var  phoneVerify = userInfoStorage.read("phoneVerify");

    if(isActive == 0 && phoneVerify == 0){

      print('Is Not Active ::::: Please Verify your Phone... $isActive'  );

    }else{

      print('Verify Phone Successful... $isActive');

      if(type == 0){
        Get.offAll(HomeScreenPlumber());
      }else if(type == 1){
        Get.offAll(HomeCustomer());
      }else if(type == 2){
        Get.offAll(HomeInspector());
      }else{

      }
    }


  }

   void saveUserInfoStorage(UserInfo userInfo){
    userInfoStorage.write('idUser', userInfo.data.id);
    userInfoStorage.write('name', userInfo.data.name);
    userInfoStorage.write('phone', userInfo.data.phone);
    userInfoStorage.write('city', userInfo.data.city);
    userInfoStorage.write('state', userInfo.data.state);
    userInfoStorage.write('identificationNumber', userInfo.data.identificationNumber);
    userInfoStorage.write('phoneVerify', userInfo.data.phoneVerify);
    userInfoStorage.write('typeUser', userInfo.typeUser);
    userInfoStorage.write('code', userInfo.data.code);
    userInfoStorage.write('apiToken', userInfo.data.apiToken);


    print('API TOKENNNNNNNNNNN >>>>>>>>>> $howToOpen');


  }




}