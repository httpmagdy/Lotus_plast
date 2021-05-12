import '../../../Services/api_key.dart';
import '../../../Services/network_services.dart';
import '../../models/get_plumber_account_model.dart';

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

    print(' Repo ========> statusCode : ${_request.data} ::::::::::::::');

    return GePlumberAccountModel.fromJson(_request.data);
  }
}
