import 'dart:convert';

Status statusFromJson(String str) => Status.fromJson(json.decode(str));

class Status {
  Status({
    this.status,
    this.data,
  });

  final bool status;
  final List<Datum> data;

  factory Status.fromJson(Map<String, dynamic> json) => Status(
        status: json["status"] == null ? null : json["status"],
        data: json["data"] == null
            ? null
            : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );
}

class Datum {
  Datum({
    this.id,
    this.name,
    this.cities,
  });

  final int id;
  final String name;
  final List<City> cities;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        cities: json["cities"] == null
            ? null
            : List<City>.from(json["cities"].map((x) => City.fromJson(x))),
      );
}

class City {
  City({
    this.id,
    this.name,
  });

  final int id;
  final String name;

  factory City.fromJson(Map<String, dynamic> json) => City(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
      );
}
