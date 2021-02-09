import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:lotus/Bloc/models/get_plumber_account_model.dart';
import 'package:lotus/Bloc/models/message_model.dart';
import 'package:lotus/Bloc/repository/Inspector_Repo/get_plumber_by_code_repo.dart';

class GetPlumberByCodeProvider extends GetxController {

  TextEditingController codeController;


  PlumberByCodeRepo _plumberByCodeRepo = PlumberByCodeRepo();

  Future<GePlumberAccountModel> plumberByCode() async {
    try{

      GePlumberAccountModel _data = await _plumberByCodeRepo.getPlumberByCodeRepo(code: codeController.text);
      return _data;

    }catch(e){
      throw e;
    }

  }


  @override
  void onInit() {
    codeController = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    codeController.dispose();
    super.dispose();
  }


}
