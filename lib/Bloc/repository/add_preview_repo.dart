import '../../Services/api_key.dart';
import '../../Services/network_services.dart';

class PreviewRepo extends NetworkService {
  Future addPreviewRepo(
      {lat, lon, address, name, phone, customerPhone2}) async {
    var _request = await post(
      url: ApiKey.addCustomerPreview,
      hasHeader: true,
      body: {
        'location_lat': lat,
        'location_lon': lat,
        'address': address,
        'pulmber_name': name,
        'pulmber_phone': phone,
        'customer_phone2': customerPhone2,
      },
    );

    print('addMaintenanceRepo => statusCode : ${_request.statusCode}');
  }
}
