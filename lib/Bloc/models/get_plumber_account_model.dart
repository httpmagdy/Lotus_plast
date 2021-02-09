
class GePlumberAccountModel {
  GePlumberAccountModel({
    this.status,
    this.message,
    this.data,
  });

  final bool status;
  final String message;
  final Data data;

  factory GePlumberAccountModel.fromJson(Map<String, dynamic> json) => GePlumberAccountModel(
    status: json["status"] == null ? null : json["status"],
    message: json["message"] == null ? null : json["message"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );
}

class Data {
  Data({
    this.pulmberName,
    this.pulmberPhone,
    this.code,
    this.id,
  });

  final String pulmberName;
  final String pulmberPhone;
  final dynamic code;
  final int id;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    pulmberName: json["pulmber_name"] == null ? null : json["pulmber_name"],
    pulmberPhone: json["pulmber_phone"] == null ? null : json["pulmber_phone"],
    code: json["code"] == null ? null : json["code"],
    id: json["id"] == null ? null : json["id"],
  );

}
