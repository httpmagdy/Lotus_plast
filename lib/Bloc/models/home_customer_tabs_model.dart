// To parse this JSON data, do
//
//     final homeCustomerModel = homeCustomerModelFromJson(jsonString);

import 'dart:convert';

HomeCustomerModel homeCustomerModelFromJson(String str) =>
    HomeCustomerModel.fromJson(json.decode(str));

class HomeCustomerModel {
  HomeCustomerModel({this.prviewToday, this.allprview, this.alldamages, p});

  final List<dynamic> prviewToday;
  final List<Allprview> allprview;
  final List<Allprview> alldamages;

  factory HomeCustomerModel.fromJson(Map<dynamic, dynamic> json) =>
      HomeCustomerModel(
        prviewToday: json["prviewToday"] == null
            ? null
            : List<dynamic>.from(json["prviewToday"].map((x) => x)),
        allprview: json["allprview"] == null
            ? null
            : List<Allprview>.from(
                json["allprview"].map((x) => Allprview.fromJson(x))),
        alldamages: json["alldamages"] == null
            ? null
            : List<Allprview>.from(
                json["alldamages"].map((x) => Allprview.fromJson(x))),
      );
}

class Allprview {
  Allprview({
    this.id,
    this.customerName,
    this.customerPhone,
    this.customerPhone2,
    this.address,
    this.pulmberName,
    this.pulmberPhone,
    this.date,
    this.time,
    this.rate,
    this.description,
    this.image,
    this.damageType,
    this.message,
    this.statusActive,
    this.isRating,
    this.addedDate,
    this.addedTime,
  });

  final int id;
  final String customerName;
  final String customerPhone;
  final dynamic customerPhone2;
  final String address;
  final String pulmberName;
  final String pulmberPhone;
  final String date;
  final String time;
  final double rate;
  final String description;
  final String image;
  final String damageType;
  final String message;
  final int statusActive;
  final bool isRating;
  final String addedDate;
  final String addedTime;

  factory Allprview.fromJson(Map<dynamic, dynamic> json) => Allprview(
        id: json["id"] == null ? null : json["id"],
        customerName:
            json["customer_name"] == null ? null : json["customer_name"],
        customerPhone:
            json["customer_phone"] == null ? null : json["customer_phone"],
        customerPhone2: json["customer_phone2"],
        address: json["address"] == null ? null : json["address"],
        pulmberName: json["pulmber_name"] == null ? null : json["pulmber_name"],
        pulmberPhone:
            json["pulmber_phone"] == null ? null : json["pulmber_phone"],
        date: json["date"] == null ? null : json["date"],
        time: json["time"] == null ? null : json["time"],
        rate:
            json["rate"] == null ? null : double.parse(json["rate"].toString()),
        description: json["description"] == null ? null : json["description"],
        image: json["image"] == null ? null : json["image"],
        statusActive:
            json["status_active"] == null ? null : json["status_active"],
        isRating: json["is_rating"] == null ? null : json["is_rating"],
        addedDate: json["added_date"] == null ? null : json["added_date"],
        addedTime: json["added_time"] == null ? null : json["added_time"],
        message: json["message"] == null ? null : json["message"],
        damageType: json["damage_type"] == null ? null : json["damage_type"],
      );
}
