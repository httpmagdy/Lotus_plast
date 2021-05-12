import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../repository/add_preview_plumber_repo.dart';

class AddPreviewPlumberProvider extends GetxController {
  // var allDamageTypes = List<Datum>();
  // final GlobalKey<FormState> globalKeyPreview = GlobalKey<FormState>();

  TextEditingController phoneController;
  TextEditingController addressController;
  // TextEditingController plumberNameController;
  // TextEditingController plumberPhoneController;

  @override
  void onInit() {
    super.onInit();
    addressController = TextEditingController();
    phoneController = TextEditingController();
    // plumberPhoneController = TextEditingController();
    // plumberNameController = TextEditingController();
  }

  final PreviewPlumberRepo _previewRepo = PreviewPlumberRepo();

  // String add = '';

  // getAddress(address){
  //    // add = address;
  //   addressController.text = address;
  //   print(address);
  //   // print(add);
  //   print(addressController.text);
  //   update();
  // }

  Future addPreview({lat, lon}) async {
    await _previewRepo.addPreviewPlumberRepo(
      phone: '',
      name: '',
      address: addressController.text,
      lat: lat,
      lon: lon,
      pulmberPhone2: phoneController.text,
    );

    print('${addressController.text}');
    print('${lat}');
    print('${lon}');
    print('${phoneController.text}');
  }

  @override
  void dispose() {
    super.dispose();
    addressController.dispose();
    phoneController.dispose();
    // plumberPhoneController.dispose();
    // plumberNameController.dispose();
  }
}
