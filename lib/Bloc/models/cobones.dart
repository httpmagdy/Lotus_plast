import 'dart:convert';

CobonesPlumberModel cobonesPlumberModelFromJson(String str) => CobonesPlumberModel.fromJson(json.decode(str));

String cobonesPlumberModelToJson(CobonesPlumberModel data) => json.encode(data.toJson());

class CobonesPlumberModel {
  CobonesPlumberModel({
    this.status,
    this.message,
    this.data,
  });

  final bool status;
  final String message;
  final Data data;

  factory CobonesPlumberModel.fromJson(Map<String, dynamic> json) => CobonesPlumberModel(
    status: json["status"] == null ? null : json["status"],
    message: json["message"] == null ? null : json["message"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status == null ? null : status,
    "message": message == null ? null : message,
    "data": data == null ? null : data.toJson(),
  };
}

class Data {
  Data({
    this.nowCount,
    this.nowValue,
    this.laterCount,
    this.laterValue,
  });

  final int nowCount;
  final int nowValue;
  final int laterCount;
  final int laterValue;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    nowCount: json["now_count"] == null ? null : json["now_count"],
    nowValue: json["now_value"] == null ? null : json["now_value"],
    laterCount: json["later_count"] == null ? null : json["later_count"],
    laterValue: json["later_value"] == null ? null : json["later_value"],
  );

  Map<String, dynamic> toJson() => {
    "now_count": nowCount == null ? null : nowCount,
    "now_value": nowValue == null ? null : nowValue,
    "later_count": laterCount == null ? null : laterCount,
    "later_value": laterValue == null ? null : laterValue,
  };
}
