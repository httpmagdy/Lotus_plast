import '../../../Services/api_key.dart';
import '../../../Services/network_services.dart';
import '../../models/getgifts_model.dart';

class GetGiftsRepo extends NetworkService {
  Future<GetGifts> getGiftsRepo() async {
    var _request = await get(url: ApiKey.getGiftsURL, hasHeader: true);

    print('get Gifts Repo => statusCode : ${_request.statusCode}');
    print('addMaintenanceRepo => data : ${_request.data}');

    return GetGifts.fromJson(_request.data);
  }
}
