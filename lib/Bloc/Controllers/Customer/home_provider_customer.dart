import 'package:get/get.dart';
import 'package:lotus/Bloc/models/home_customer_tabs_model.dart';
import 'package:lotus/Services/api_key.dart';
import 'package:lotus/Services/network_services.dart';

class HomeCategoryCustomerProvider extends GetxController {
  var allDamage = List<Allprview>().obs;
  var allPreview = List<Allprview>().obs;

  @override
  void onInit() {
    print("object GET +++++++++++++++++++++++++++++++");
    homeCustomerProvider();
    print("object GET +++++++++++++++++++++++++++++++");
    // homeLoading = true.obs;

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

  Future homeCustomerProvider() async {
    try {
      allPreview.clear();
      allDamage.clear();
      // homeLoading(true);
      var _request = await _networkService.get(
        url: ApiKey.homeCategoryCustomerURL,
        hasHeader: true,
      );

      print(' Status Code :::: ${_request.statusCode} ');
      final _statusData = HomeCustomerModel.fromJson(_request.data);
      for (var item in _statusData.alldamages) {
        allDamage.add(item);
      }
      for (var item in _statusData.allprview) {
        allPreview.add(item);
      }
    } finally {
      homeLoading(false);
      // update();
      print(' homeLoading  :::: ${homeLoading.value} ');
      print(' LEEEEEEEENTH all Damage :::: ${allDamage.length} ');
      print(' LEEEEEEEENTH all Preview :::: ${allPreview.length} ');
      // print(' finally data :::: ${stateFilter.length}  ${stateFilter} ');
    }
  }

  // @override
  // void onClose() {
  //
  //   super.onClose();
  // }

}
