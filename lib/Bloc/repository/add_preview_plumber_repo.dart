import 'package:lotus/Services/api_key.dart';
import 'package:lotus/Services/network_services.dart';

class PreviewPlumberRepo extends NetworkService {
  Future addPreviewPlumberRepo({
    lat,
    lon,
    address,
    name,
    phone,
    pulmberPhone2
  }) async {
    var _request = await post(
      url: ApiKey.addPlumberPreview,
      hasHeader: true,
      body: {
        'location_lat': lat,
        'location_lon': lat,
        'address': address,
        'customer_name': name,
        'customer_phone': phone,
        'pulmber_phone2': pulmberPhone2,
      },
    );

    print( 'ADD Preview Plumber Repo ========> statusCode : ${_request.statusCode} ::::::::::::::');

  }
}
