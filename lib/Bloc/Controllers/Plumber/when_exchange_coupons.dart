import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:lotus/Bloc/repository/when_exchange_coupons_repo.dart';
import 'package:lotus/ui/widget/custom_dialog.dart';

class WhenExchangeCouponsProvider extends GetxController {
  TextEditingController priceController;
  TextEditingController wallerNumberController;
  RxInt typeId = 0.obs;
  @override
  void onInit() {
    super.onInit();
    wallerNumberController = TextEditingController();
    priceController = TextEditingController();
  }

  ExchangeCouponsRepo _exchangeCouponsRepo = ExchangeCouponsRepo();

  Future exchangeCoupons() async {
    Message data = await _exchangeCouponsRepo.exchangeCouponsRepo(
      price: priceController.text,
      wallerNumber: wallerNumberController.text,
      type: typeId,
    );

    print('typeId $typeId');
    print(' priceController.text ${priceController.text}');
    print('typeId ${wallerNumberController.text}');

    print('typeId ${data.status}');
    print('typeId ${data.message}');

    return Message(status: data.status, message: data.message);
  }

  @override
  void dispose() {
    super.dispose();
    wallerNumberController.dispose();
    priceController.dispose();
  }
}
