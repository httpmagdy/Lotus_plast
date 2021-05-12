import '../../../Services/api_key.dart';
import '../../../Services/network_services.dart';
import '../../models/message_model.dart';

class SendRatePreviewRepo extends NetworkService {
  Future<Message> sendRateRepo({
    rate,
    previewId,
  }) async {
    var _request = await post(
      url: ApiKey.sendRatePreviewURL,
      hasHeader: true,
      body: {
        'rate': rate,
        'preview_id': previewId,
      },
    );

    return Message.fromJson(_request.data);
  }
}
