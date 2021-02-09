// To parse this JSON data, do
//
//     final homePlumber = homePlumberFromJson(jsonString);

import 'dart:convert';

HomePlumber homePlumberFromJson(String str) => HomePlumber.fromJson(json.decode(str));


class HomePlumber {
  HomePlumber({
    this.status,
    this.message,
    this.allprview,
    this.alldamages,
  });

  final bool status;
  final String message;
  final List<Allprview> allprview;
  final List<Allprview> alldamages;

  factory HomePlumber.fromJson(Map<String, dynamic> json) => HomePlumber(
    status: json["status"] == null ? null : json["status"],
    message: json["message"] == null ? null : json["message"],
    allprview: json["allprview"] == null ? null : List<Allprview>.from(json["allprview"].map((x) => Allprview.fromJson(x))),
    alldamages: json["alldamages"] == null ? null : List<Allprview>.from(json["alldamages"].map((x) => Allprview.fromJson(x))),
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

this.message,
    this.damageType,

  });

  final int id;
  final String customerName;
  final String customerPhone;
  final dynamic customerPhone2;
  final String address;
  final String pulmberName;
  final String pulmberPhone;
  final dynamic date;
  final dynamic time;
  final int rate;
  final dynamic description;
  final dynamic image;
  final String damageType;
  final String message;

  factory Allprview.fromJson(Map<String, dynamic> json) => Allprview(
    id: json["id"] == null ? null : json["id"],
    customerName: json["customer_name"] == null ? null : json["customer_name"],
    customerPhone: json["customer_phone"] == null ? null : json["customer_phone"],
    customerPhone2: json["customer_phone2"],
    address: json["address"] == null ? null : json["address"],
    pulmberName: json["pulmber_name"] == null ? null : json["pulmber_name"],
    pulmberPhone: json["pulmber_phone"] == null ? null : json["pulmber_phone"],
    date: json["date"],
    time: json["time"],
    rate: json["rate"] == null ? null : json["rate"],
    description: json["description"],
    image: json["image"],
    damageType: json["damage_type"] == null ? null : json["damage_type"],
    message: json["message"] == null ? null : json["message"],
  );

}
