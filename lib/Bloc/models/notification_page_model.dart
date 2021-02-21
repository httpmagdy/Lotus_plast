// To parse this JSON data, do
//
//     final notificationModel = notificationModelFromJson(jsonString);



class NotificationModel {
  NotificationModel({
    this.status,
    this.message,
    this.notifications,
  });

  final bool status;
  final String message;
  final List<Notification> notifications;

  factory NotificationModel.fromJson(Map<String, dynamic> json) => NotificationModel(
    status: json["status"] == null ? null : json["status"],
    message: json["message"] == null ? null : json["message"],
    notifications: json["notifications"] == null ? null : List<Notification>.from(json["notifications"].map((x) => Notification.fromJson(x))),
  );

}

class Notification {
  Notification({
    this.data,
  });

  final NotificationData data;

  factory Notification.fromJson(Map<String, dynamic> json) => Notification(
    data: json["data"] == null ? null : NotificationData.fromJson(json["data"]),
  );
}

class NotificationData {
  NotificationData({
    this.to,
    this.data,
  });

  final String to;
  final DataData data;

  factory NotificationData.fromJson(Map<String, dynamic> json) => NotificationData(
    to: json["to"] == null ? null : json["to"],
    data: json["data"] == null ? null : DataData.fromJson(json["data"]),
  );

}

class DataData {
  DataData({
    this.title,
    this.body,
    this.clickAction,
    this.id,
    this.time,
  });

  final String title, time;
  final String body;
  final String clickAction;
  final int id;

  factory DataData.fromJson(Map<String, dynamic> json) => DataData(
    title: json["title"] == null ? null : json["title"],
    time: json["time"] == null ? null : json["time"],
    body: json["body"] == null ? null : json["body"],
    clickAction: json["click_action"] == null ? null : json["click_action"],
    id: json["id"] == null ? null : json["id"],
  );
}
