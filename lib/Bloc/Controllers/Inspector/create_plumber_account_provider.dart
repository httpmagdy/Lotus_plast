import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:lotus/Bloc/models/get_plumber_account_model.dart';

import 'package:lotus/Bloc/repository/Inspector_Repo/create_plumber_account_Repo.dart';

class CreatePlumberAccountProvider extends GetxController {

  TextEditingController nameController;
  TextEditingController phoneController;


  CreatePlumberAccountRepo _repo = CreatePlumberAccountRepo();

  Future<GePlumberAccountModel> createPlumberAccount() async {
    try{

      GePlumberAccountModel _data = await _repo.createAccountRepo(

        name: nameController.text,
        phone: phoneController.text,

      );
      return _data;

    }catch(e){
      throw e;
    }

  }


  @override
  void onInit() {
    nameController = TextEditingController();
    phoneController = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    super.dispose();
  }


}
