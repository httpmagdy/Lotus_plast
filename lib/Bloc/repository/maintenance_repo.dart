
import 'package:lotus/Services/api_key.dart';
import 'package:lotus/Services/network_services.dart';

class MaintenanceRepo extends NetworkService{


  Future addMaintenanceRepo({
    damageId,
    message,
    image,
  }) async{

    var _request = await post(url: ApiKey.addCustomerMaintenanceURL,hasHeader: true, body: {
      'damage_id': damageId,
      'message': message,
      'image': image,
    });

    print('addMaintenanceRepo => statusCode : ${_request.statusCode}');
    // print('addMaintenanceRepo => data : ${_request.data}');

  }


}

