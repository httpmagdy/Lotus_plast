import 'package:get_storage/get_storage.dart';
import 'package:lotus/Bloc/models/message_model.dart';
import 'package:lotus/Services/api_key.dart';
import '../../Services/network_services.dart';

class VerifyPhoneRepo extends NetworkService{
  final GetStorage userInfoStorage = GetStorage();

  Future verifyCodeRepo() async {

    var _request = await get(url: ApiKey.verifyPhoneURL, hasHeader: true);

    print('Verify Phone => data : ${_request.data}');

    if(_request.data != null){
      await userInfoStorage.write('phoneVerify', 1);
    }else{
      print("Faild To Verifay ((((- VerifyPhoneRepo -))))");
    }



    // return Message.fromJson(_request.data);

  }

}
