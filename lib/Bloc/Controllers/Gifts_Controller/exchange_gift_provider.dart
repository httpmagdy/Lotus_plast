import 'package:get/get.dart';

import '../../models/message_model.dart';
import '../../repository/Gifts_Repo/exchange_gift_repo.dart';

class ExchangeGiftProvider extends GetxController {
  RxInt imageId = 0.obs;

  ExchangeGiftRepo _giftRepo = ExchangeGiftRepo();

  Future<Message> exchangeGift() async {
    var _data = await _giftRepo.exchangeGiftRepo(imageId.value);

    return _data;

    print('get Gifts Repo => statusCode : ${_data.status}');
    print('addMaintenanceRepo => data : ${_data.message}');
  }
}
