import 'package:lotus/Bloc/models/message_model.dart';
import 'package:lotus/Services/api_key.dart';
import 'package:lotus/Services/network_services.dart';

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
