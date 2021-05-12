import 'package:get/get.dart';

import '../../Services/api_key.dart';
import '../../Services/network_services.dart';

class CertificatesProvider extends GetxController {
  @override
  void onInit() {
    fetchCertificates();
    super.onInit();
  }

  RxBool loading = true.obs;

  RxList images = List<Datum>().obs;

  NetworkService _networkService = NetworkService();

  Future fetchCertificates() async {
    loading(true);
    try {
      var _request = await _networkService.get(url: ApiKey.getcertificatesUrl);

      print(' Status Code :::: ${_request.statusCode} ');
      print(' fetchCertificates === :::: ${_request.data} ');

      ImgModel data = ImgModel.fromJson(_request.data);

      for (var item in data.data) {
        images.add(item);
      }

      loading(false);
    } catch (e) {
      print('fetchCertificates ==? $e');
    }
  }
}

class ImgModel {
  ImgModel({
    this.status,
    this.data,
  });

  final bool status;
  final List<Datum> data;

  factory ImgModel.fromJson(Map<String, dynamic> json) => ImgModel(
        status: json["status"] == null ? null : json["status"],
        data: json["data"] == null
            ? null
            : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );
}

class Datum {
  Datum({
    this.id,
    this.image,
  });

  final int id;
  final String image;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"] == null ? null : json["id"],
        image: json["image"] == null ? null : json["image"],
      );
}
