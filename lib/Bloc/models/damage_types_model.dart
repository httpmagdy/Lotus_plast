// To parse this JSON data, do
//
//     final damageTypes = damageTypesFromJson(jsonString);

import 'dart:convert';

DamageTypes damageTypesFromJson(String str) => DamageTypes.fromJson(json.decode(str));

String damageTypesToJson(DamageTypes data) => json.encode(data.toJson());

class DamageTypes {
  DamageTypes({
    this.status,
    this.message,
    this.data,
  });

  final bool status;
  final String message;
  final List<Datum> data;

  factory DamageTypes.fromJson(Map<String, dynamic> json) => DamageTypes(
    status: json["status"] == null ? null : json["status"],
    message: json["message"] == null ? null : json["message"],
    data: json["data"] == null ? null : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status == null ? null : status,
    "message": message == null ? null : message,
    "data": data == null ? null : List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    this.id,
    this.name,
  });

  final int id;
  final String name;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"] == null ? null : json["id"],
    name: json["name"] == null ? null : json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "name": name == null ? null : name,
  };
}
