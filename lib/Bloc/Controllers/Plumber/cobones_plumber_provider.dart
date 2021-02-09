import 'package:get/get.dart';
import 'package:lotus/Bloc/models/cobones.dart';
import 'package:lotus/Services/api_key.dart';
import 'package:lotus/Services/network_services.dart';

// AddMaintenanceProvider

class CobonesPlumberProvider extends GetxController {
  // var allDamageTypes = List<Datum>().obs;

  var laterCount = 0.obs;
  var laterValue = 0.obs;
  var nowCount = 0.obs;
  var nowValue = 0.obs;

  @override
  void onInit() {
    getCobones();
    super.onInit();
  }

  NetworkService _networkService = NetworkService();

  Future getCobones() async {
    var _request =
    await _networkService.get(url: ApiKey.cobonesURL, hasHeader: true);

    print('cobones ==== Status Code :::: ${_request.statusCode} ');

    try {
      final _cobonessData = CobonesPlumberModel.fromJson(_request.data);

      print(' _cobonessData == data ::::${_cobonessData.data} ');

      laterCount.value = _cobonessData.data.laterCount;
      laterValue.value = _cobonessData.data.laterValue;
      nowCount.value = _cobonessData.data.nowCount;
      nowValue.value = _cobonessData.data.nowValue;

    } finally {
      // print(' finally data :::: ${allDamageTypes.length}  ${allDamageTypes} ');
    }
  }
}
