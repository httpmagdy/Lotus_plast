import 'package:get/get.dart';
import 'package:lotus/Services/api_key.dart';
import 'package:lotus/Services/network_services.dart';
import '../../models/damage_types_model.dart';

// AddMaintenanceProvider

class DamageTypesProvider extends GetxController {
  var allDamageTypes = List<Datum>().obs;

  @override
  void onInit() {
    getDamageTypes();
    super.onInit();
  }

  NetworkService _networkService = NetworkService();

  Future getDamageTypes() async {
    var _request =
        await _networkService.get(url: ApiKey.damageTypesURL, hasHeader: true);

    print(' Status Code :::: ${_request.statusCode} ');

    try {
      final _statusData = DamageTypes.fromJson(_request.data);

      print('============================== $_statusData');

      for (var item in _statusData.data) {
        allDamageTypes.add(item);
        // update();
      }

    } finally {
      print(' finally data :::: ${allDamageTypes.length}  ${allDamageTypes} ');
    }
  }
}
