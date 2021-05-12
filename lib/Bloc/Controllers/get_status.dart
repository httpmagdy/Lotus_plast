import 'package:get/get.dart';

import '../../Services/api_key.dart';
import '../../Services/network_services.dart';
import '../models/status_model.dart';

class StatusProvider extends GetxController {
  var stateFilter = List<Datum>();

  @override
  void onInit() {
    getStates();
    super.onInit();
  }

  NetworkService _networkService = NetworkService();

  Future getStates() async {
    var _request = await _networkService.get(url: ApiKey.statesURL);

    print(' Status Code :::: ${_request.statusCode} ');
    // print(' data :::: ${_request.data} ');

    try {
      final _statusData = Status.fromJson(_request.data);
      for (var item in _statusData.data) {
        stateFilter.add(item);
        update();
      }
    } finally {
      // print(' finally data :::: ${stateFilter.length}  ${stateFilter} ');
    }
  }
}
