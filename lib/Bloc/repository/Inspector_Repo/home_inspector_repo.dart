import 'package:lotus/Bloc/models/home_inspector_model.dart';
import 'package:lotus/Services/api_key.dart';
import 'package:lotus/Services/network_services.dart';

class HomeInspectorRepo extends NetworkService {

  Future<HomeInspectorModel> inspectorRepo() async {
    try {

      var _request = await get(
        url: ApiKey.inspectorHomeURL,
        hasHeader: true,
      );

      print(' HomeInspectorModel =================== :::: ${_request.statusCode}');
      // print(' HomeInspectorModel :::: ${_request.data}');

      return HomeInspectorModel.fromJson(_request.data);

    } finally {

    }
  }


}
