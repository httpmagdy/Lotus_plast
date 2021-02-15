import 'package:lotus/Bloc/models/user_info.dart';
import 'package:lotus/Services/api_key.dart';
import 'package:lotus/Services/network_services.dart';

class RegisterRepo extends NetworkService {
  Future registerRepo(RegisterModel register) async {

    var _request = await post(url: ApiKey.registerURL, body: {
      'name': register.name,
      'phone': register.phone,
      'password': register.password,
      'state_id': register.stateId,
      'identification_number': register.identificationNumber,
      'type_user': register.typeUser,
      'city_id': register.cityId,
      'device_token': register.deviceToken,
    });

    print('REGISTER => statusCode : ${_request.statusCode}');
    print('REGISTER => statusCode : ${_request.data}');


    if(_request.statusCode >= 200 && _request.statusCode < 300){
      return UserInfo.fromJson(_request.data);
    }else{
      print('Register Error ...');
      return null;
    }


  }
}

class RegisterModel {
  final String name,
      phone,
      password,
      stateId,
      cityId,
      identificationNumber, deviceToken;


  int typeUser;

  RegisterModel({
    this.name,
    this.phone,
    this.password,
    this.stateId,
    this.cityId,
    this.identificationNumber,
    this.typeUser,
    this.deviceToken,

  });
}
