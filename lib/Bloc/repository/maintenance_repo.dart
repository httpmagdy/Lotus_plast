import 'package:async/async.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:path/path.dart';

import '../../Services/api_key.dart';
import '../../Services/network_services.dart';

class MaintenanceRepo extends NetworkService {
  Future addMaintenanceRepo({
    damageId,
    message,
    image,
  }) async {
    var _request = await post(
        url: ApiKey.addCustomerMaintenanceURL,
        hasHeader: true,
        body: {
          'damage_id': damageId,
          'message': message,
          // 'image': image,
        });

    print('addMaintenanceRepo => statusCode : ${_request.statusCode}');
    // print('addMaintenanceRepo => data : ${_request.data}');
  }

  GetStorage _getStorage = GetStorage();

  Future addMaintenanceWithImageRepo({
    damageId,
    message,
    image,
  }) async {
    try {
      var userToken = await _getStorage.read('apiToken');

      print("start >>>>>>>>>>>>>>>>>>>>>>>>>>>");
      print(' avdImage ID :::  $image');

      var imageStream = http.ByteStream(
        DelegatingStream(
          image.openRead(),
        ),
      );

      var imageLength = await image.length();

      var uri = Uri.parse(ApiKey.baseURL + ApiKey.addCustomerMaintenanceURL);

      var request = http.MultipartRequest("POST", uri);

      var multipartFileAdv = http.MultipartFile(
        'image',
        imageStream,
        imageLength,
        filename: basename(image.path),
        contentType: MediaType('image', 'jpg'),
      );

      request.files.add(multipartFileAdv);

      request.headers.addAll({'Authorization': 'Bearer $userToken'});

      request.fields.addAll({
        'damage_id': damageId.toString(),
        'message': message,
      });

      await request.send().then((response) {
        print(
            "STATUS Uploaded! =>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> ${response.statusCode}");

        if (response.statusCode == 200)
          print("Succes Uploaded! ${response.statusCode}");
        else
          print("Error Uploaded! ${response.statusCode}");
      });
    } finally {
      // Get.back();
      print("finally >>>>>>>>");
      // isLoadingAvd(false);
    }
  }
}
