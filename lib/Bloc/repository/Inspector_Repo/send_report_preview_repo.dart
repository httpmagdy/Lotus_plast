import 'package:get_storage/get_storage.dart';
import 'package:lotus/Bloc/models/message_model.dart';
import 'package:lotus/Services/api_key.dart';
import 'package:lotus/Services/network_services.dart';

import 'package:http/http.dart' as http;
import 'package:async/async.dart';
import 'package:path/path.dart';
import 'package:http_parser/http_parser.dart';

class SendReportPreviewInspectorRepo extends NetworkService {
  Future<Message> sendReportPreview({
    previewId,
    description,
    // address,
  }) async {
    var _request = await post(
      url: ApiKey.sendReportPreviewURL,
      hasHeader: true,
      body: {
        'preview_id': previewId,
        'description': description,
        // 'image': image,
      },
    );

    return Message.fromJson(_request.data);
  }

  GetStorage _getStorage = GetStorage();

  Future sendReportPreviewWithImage({
    previewId,
    description,
    image,
  }) async {
    try {
      var statusCode;

      var userToken = await _getStorage.read('apiToken');

      print("start >>>>>>>>>>>>>>>>>>>>>>>>>>>");
      print(' avdImage ID :::  $image');

      var imageStream = http.ByteStream(
        DelegatingStream(
          image.openRead(),
        ),
      );

      var imageLength = await image.length();

      var uri = Uri.parse(ApiKey.baseURL + ApiKey.sendReportPreviewURL);

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
        'preview_id': previewId.toString(),
        'description': description,
      });

      await request.send().then((response) {
        statusCode = response.statusCode;
        // update();
        print(
            "STATUS Uploaded! =>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> ${response.statusCode}");

        if (response.statusCode == 200) {
          print("Succes Uploaded! ${response.statusCode}");
        } else {
          print("Error Uploaded! ${response.statusCode}");
        }
      });

      return statusCode;
    } finally {
      // Get.back();
      print("finally >>>>>>>>");
      // isLoadingAvd(false);
    }
  }
}
