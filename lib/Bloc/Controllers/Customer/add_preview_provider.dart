import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:lotus/Bloc/repository/add_preview_repo.dart';
import 'package:lotus/Bloc/repository/maintenance_repo.dart';

import '../Maps_Controller/geolocator_u.dart';

// GetUserPosition getUserPosition = GetUserPosition();

class AddPreviewProvider extends GetxController {
  // var allDamageTypes = List<Datum>();
  // final GlobalKey<FormState> globalKeyPreview = GlobalKey<FormState>();

  TextEditingController phoneController;
  TextEditingController addressController;
  TextEditingController plumberNameController;
  TextEditingController plumberPhoneController;

  @override
  void onInit() {
    super.onInit();
    addressController = TextEditingController();
    phoneController = TextEditingController();
    plumberPhoneController = TextEditingController();
    plumberNameController = TextEditingController();
  }

  final PreviewRepo _previewRepo = PreviewRepo();


  //  saveAddress(){
  //    addressController.text = _currentAddress;
  //    addressController.text = _currentAddress;
  //    addressExist = true;
  //    update();
  //    // print('_currentAddress :::.............. ${_currentAddress}');
  //    // print(' addPreviewProvider.addressController.text ::>>>: ${ addPreviewProvider.addressController.text}');
  // }

  Future addPreview({lat, lon}) async {
    await _previewRepo.addPreviewRepo(
      phone: plumberPhoneController.text,
      name: plumberNameController.text,
      address: addressController.text,
      lat: lat,
      lon: lon,
      customerPhone2: phoneController.text,
    );

    print('${plumberPhoneController.text}');
    print('${plumberNameController.text}');
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
    plumberPhoneController.dispose();
    plumberNameController.dispose();
  }
}
