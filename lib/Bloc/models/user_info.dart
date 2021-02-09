import 'dart:convert';

UserInfo userInfoFromJson(String str) => UserInfo.fromJson(json.decode(str));


class UserInfo {
  UserInfo({
    this.status,
    this.message,
    this.data,
    this.typeUser,
  });

  final bool status;
  final String message;
  final Data data;
  final int typeUser;

  factory UserInfo.fromJson(Map<String, dynamic> json) => UserInfo(
        status: json["status"] == null ? null : json["status"],
        message: json["message"] == null ? null : json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        typeUser: json["type_user"] == null ? null : json["type_user"],
      );

}

class Data {
  Data({
    this.id,
    this.code,
    this.name,
    this.phone,
    this.phoneVerify,
    this.identificationNumber,
    this.state,
    this.city,
    this.apiToken,
  });

  final int id;
  final dynamic code;
  final String name;
  final String phone;
  final int phoneVerify;
  final String identificationNumber;
  final String state;
  final String city;
  final String apiToken;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"] == null ? null : json["id"],
        apiToken: json["api_token"] == null ? null : json["api_token"],
        code: json["code"] == null ? null : json["code"],
        name: json["name"] == null ? null : json["name"],
        phone: json["phone"] == null ? null : json["phone"],
        phoneVerify: json["phone_verify"] == null ? null : json["phone_verify"],
        identificationNumber: json["identification_number"] == null
            ? null
            : json["identification_number"],
        state: json["state"] == null ? null : json["state"],
        city: json["city"] == null ? null : json["city"],
      );

}
