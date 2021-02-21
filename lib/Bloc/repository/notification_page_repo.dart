import 'package:lotus/Bloc/models/notification_page_model.dart';
import 'package:lotus/Services/api_key.dart';
import 'package:lotus/Services/network_services.dart';
import 'dart:convert';
class NotificationsPageRepo extends NetworkService {

  Future<NotificationModel> notificationsPageRepo() async {

    var _response = await get(url: ApiKey.myNotificationsURL, hasHeader: true);

    print(' my Notifications s t a t s   :::: ${_response.statusCode}');
    print(' my Notifications d a t a   :::: ${_response.data}');

    // var rrr = json.decode(_response.data);
    // print("DDDD :::: $rrr");

    return NotificationModel.fromJson(_response.data);

  }

}