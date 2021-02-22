import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lotus/Bloc/models/home_customer_tabs_model.dart';
import 'package:lotus/Services/api_key.dart';
import 'package:lotus/Services/network_services.dart';

class HomeCategoryPlumberProvider extends GetxController {
  var allDamage = List<Allprview>().obs;
  var allPreview = List<Allprview>().obs;

  @override
  void onInit() {
    print("object GET +++++++++++++++++++++++++++++++");
    homePlumberProvider();
    print("object GET +++++++++++++++++++++++++++++++");
    super.onInit();
  }

  getPreviewById(id){
    Allprview to = allPreview?.firstWhere((e) => e.id == id);

    print("TTTTTTo :::: $to");

    // return to;
    return to;
  }

  RxBool homeLoading = true.obs;

  NetworkService _networkService = NetworkService();

  Future homePlumberProvider() async {
    try {
      allDamage.clear();
      allPreview.clear();
      // homeLoading(true);
      var _request = await _networkService.get(
        url: ApiKey.homeCategoryPlumberURL,
        hasHeader: true,
      );

      // $2y$10$qGzKlYOXqwyC7sfKAYxUf.EYJjfLI2bvsigMht.lhA3GlzEL7SVJ.

      print('(((((((((((((_request)))))))))) {$_request}');
      print(' (((((((((((((_request)))))))))) { Status Code :::: ${_request.statusCode} ');

      final _statusData = HomeCustomerModel.fromJson(_request.data);
      for (var item in _statusData.alldamages) {
        allDamage.add(item);
      }
      for (var item in _statusData.allprview) {
        allPreview.add(item);
      }
    } finally {
      homeLoading(false);
      print(' homeLoading  :::: ${homeLoading.value} ');
      print(' LEEEEEEEENTH all Damage :::: ${allDamage.length} ');
      print(' LEEEEEEEENTH all Preview :::: ${allPreview.length} ');
      // print(' finally data :::: ${stateFilter.length}  ${stateFilter} ');
    }
  }

  // @override
  // void onClose() {
  //   _homeCustomerProvider();

  //   super.onClose();
  // }

}
