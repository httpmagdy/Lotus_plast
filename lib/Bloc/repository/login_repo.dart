import 'package:lotus/Bloc/models/user_info.dart';
import 'package:lotus/Services/api_key.dart';
import 'package:lotus/Services/network_services.dart';

 class LoginRepo extends NetworkService{

  Future loginRepo(LoginModel login) async{

    var _request = await post(url: ApiKey.loginURL, body: {
      'phone': login.username,
      'password': login.password,
      'device_token': login.deviceToken,
    });

    print('LOGIN => statusCode : ${_request.statusCode}');
    print('LOGIN => statusCode : ${_request.data}');

    if(_request.statusCode >= 200 && _request.statusCode < 300){
      return UserInfo.fromJson(_request.data);
    }else{
      print('LOGIN Error ...');
      return null;
    }

  }
}

class LoginModel{
   final String username;
   final String password;
   final String deviceToken;
   LoginModel(this.username, this.password, this.deviceToken);
}