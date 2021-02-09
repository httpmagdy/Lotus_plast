import 'package:lotus/Bloc/models/getgifts_model.dart';
import 'package:lotus/Services/api_key.dart';
import 'package:lotus/Services/network_services.dart';

class GetGiftsRepo extends NetworkService{

  Future<GetGifts> getGiftsRepo() async{

    var _request = await get(url: ApiKey.getGiftsURL, hasHeader: true);

    print('get Gifts Repo => statusCode : ${_request.statusCode}');
    print('addMaintenanceRepo => data : ${_request.data}');

    return GetGifts.fromJson(_request.data);

  }

}