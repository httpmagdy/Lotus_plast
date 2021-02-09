import 'package:lotus/Bloc/models/message_model.dart';
import 'package:lotus/Services/api_key.dart';
import 'package:lotus/Services/network_services.dart';

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

    print( 'Send Report Preview Inspector Repo ========> statusCode : ${_request.statusCode} ::::::::::::::');

  }
}
