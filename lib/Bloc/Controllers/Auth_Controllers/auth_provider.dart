import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:lotus/Bloc/models/user_info.dart';
import 'package:lotus/ui/screen/Customer/home_customer.dart';
import 'package:lotus/ui/screen/Inspector/home_inspector.dart';
import 'package:lotus/ui/screen/Plumber/home_screen.dart';

class AuthProvider{

  final GetStorage userInfoStorage = GetStorage();


  final GetStorage howToOpen = GetStorage();


  // app()async{
  //   var _seen = await  howToOpen.read("typeUser");
  //
  //   if(_seen == null){
  //
  //
  //
  //     return  WelcomeScreen();
  //
  //   }else if(_seen == true){
  //
  //
  //     return OnBoardingScreen();
  //
  //
  //
  //   }
  //
  //
  // }

  void getUserType(int type){
    print('dataResponse.typeUser ::::: ${type}');

    if(type == 0){
      Get.offAll(HomeScreenPlumber());
    }else if(type == 1){
      Get.offAll(HomeCustomer());
    }else if(type == 2){
      Get.offAll(HomeInspector());
    }else{

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