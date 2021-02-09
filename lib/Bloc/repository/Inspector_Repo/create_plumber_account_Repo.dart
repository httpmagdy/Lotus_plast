import 'package:lotus/Bloc/models/get_plumber_account_model.dart';
import 'package:lotus/Services/api_key.dart';
import 'package:lotus/Services/network_services.dart';

class CreatePlumberAccountRepo extends NetworkService {
  Future<GePlumberAccountModel> createAccountRepo({
    name,
    phone,
  }) async {
    var _request = await post(
      url: ApiKey.createPlumberAccountURL,
      hasHeader: true,
      body: {
        'name': name,
        'phone': phone,
      },
    );

    print( ' Repo ========> statusCode : ${_request.data} ::::::::::::::');


    return GePlumberAccountModel.fromJson(_request.data);

  }
}
