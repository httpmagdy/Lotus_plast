import 'package:lotus/Bloc/models/message_model.dart';
import 'package:lotus/Services/api_key.dart';
import '../../Services/network_services.dart';

class VerifyPhoneRepo extends NetworkService{

  Future<Message> verifyCodeRepo() async {

    var _request = await get(url: ApiKey.verifyPhoneURL, hasHeader: true);

    print('Verify Phone => data : ${_request.data}');

    return Message.fromJson(_request.data);

  }

}
