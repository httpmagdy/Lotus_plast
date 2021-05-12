import 'dart:io';

import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart' as getX;
import 'package:get_storage/get_storage.dart';

import '../ui/widget/custom_dialog.dart';
import '../utils/internete_connectivty.dart';
import 'api_key.dart';

class NetworkService {
  NWConnectivty _nWConnectivty = getX.Get.put(NWConnectivty());

  GetStorage _getStorage = GetStorage();

  Dio dio = Dio();

  // var headersAuth = {
  //   'Authorization':
  //       'Bearer \$2y\$10\$kJRzGKDuz2I9KELO1o.edeNC.TdFr3ctVZHOlR9CCyAmEOVOZ8XXu'
  // };

  Future<Response> get({
    @required String url,
    Map headers,
    bool hasHeader = false,
  }) async {
    var result = await Connectivity().checkConnectivity();
    bool isConnected = _nWConnectivty.showConnectivty(result);

    if (isConnected) {
      var userToken = await _getStorage.read('apiToken');
      print("userToken get >>>>>>>>>>>  $userToken");

      var response;
      try {
        dio.options.baseUrl = ApiKey.baseURL;
        response = await dio.get(
          url,
          options: Options(
            headers:
                hasHeader ? {'Authorization': 'Bearer $userToken'} : headers,
          ),
        );
        print('response statusCode =============  ${response.statusCode}');
      } on SocketException catch (error) {
        print('not connected SocketException ............ ::: $error');
      } on DioError catch (e) {
        print('DioError <<:::>> $e');

        if (e.response != null) {
          response = e.response;
        }
      }

      return handleResponse(response);
    }
  }

  Future<Response> post({
    @required String url,
    Map<String, String> headers,
    Map<String, dynamic> body,
    encoding,
    bool hasHeader = false,
  }) async {
    var result = await Connectivity().checkConnectivity();
    bool isConnected = _nWConnectivty.showConnectivty(result);

    if (isConnected) {
      var userToken = await _getStorage.read('apiToken');
      print("userToken >>>> POST >>>>>>>  $userToken");
      var response;
      dio.options.baseUrl = ApiKey.baseURL;
      try {
        response = await dio.post(
          url,
          data: body,
          options: Options(
            headers:
                hasHeader ? {'Authorization': 'Bearer $userToken'} : headers,
            requestEncoder: encoding,
          ),
        );

        print('response statusCode =============  ${response.statusCode}');
      } on DioError catch (e) {
        print('DioError <<:: 2 ::>> $e');

        if (e.response != null) {
          response = e.response;
        }
      } on SocketException catch (error) {
        print('not connected ::: $error');
      }

      return handleResponse(response);
    }
  }

  Response handleResponse(Response response) {
    final int statusCode = response.statusCode;
    if (statusCode >= 200 && statusCode < 300) {
      print("correct request: " + response.toString());
      return response;
    } else {
      getX.Get.back();
      getX.Get.dialog(
        OkDialog(
          title: 'حدث خطأ ما',
          image: 'assets/img/okicon.png',
          body: '${response.data["message"]}',
          onTapOk: () {
            getX.Get.back();
          },
        ),
      );
      print("request error: " + response.toString());
      return response;
    }
  }
}
