import '../../../Services/api_key.dart';
import '../../../Services/network_services.dart';
import '../../models/get_plumber_account_model.dart';

class PlumberByCodeRepo extends NetworkService {
  Future<GePlumberAccountModel> getPlumberByCodeRepo({
    code,
  }) async {
    var _request = await post(
      url: ApiKey.getPlumberByCodeURL,
      hasHeader: true,
      body: {
        'code': code,
      },
    );

    print(
        'get Plumber By Code Repo Repo ========> statusCode : ${_request.statusCode} ::::::::::::::');

    return GePlumberAccountModel.fromJson(_request.data);

    print(
        'Send Report Preview Inspector Repo ========> statusCode : ${_request.statusCode} ::::::::::::::');
  }
}
