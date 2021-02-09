import 'dart:convert';

GetGifts getGiftsFromJson(String str) => GetGifts.fromJson(json.decode(str));

String getGiftsToJson(GetGifts data) => json.encode(data.toJson());

class GetGifts {
  GetGifts({
    this.status,
    this.message,
    this.nuOfMaintenance,
    this.gifts,
  });

  final bool status;
  final String message;
  final int nuOfMaintenance;
  final List<Gift> gifts;

  factory GetGifts.fromJson(Map<String, dynamic> json) => GetGifts(
    status: json["status"] == null ? null : json["status"],
    message: json["message"] == null ? null : json["message"],
    nuOfMaintenance: json["nu_of_maintenance"] == null ? null : json["nu_of_maintenance"],
    gifts: json["gifts"] == null ? null : List<Gift>.from(json["gifts"].map((x) => Gift.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status == null ? null : status,
    "message": message == null ? null : message,
    "nu_of_maintenance": nuOfMaintenance == null ? null : nuOfMaintenance,
    "gifts": gifts == null ? null : List<dynamic>.from(gifts.map((x) => x.toJson())),
  };
}

class Gift {
  Gift({
    this.id,
    this.number,
    this.images,
  });

  final int id;
  final int number;
  final List<Image> images;

  factory Gift.fromJson(Map<String, dynamic> json) => Gift(
    id: json["id"] == null ? null : json["id"],
    number: json["number"] == null ? null : json["number"],
    images: json["images"] == null ? null : List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "number": number == null ? null : number,
    "images": images == null ? null : List<dynamic>.from(images.map((x) => x.toJson())),
  };
}

class Image {
  Image({
    this.id,
    this.image,
  });

  final int id;
  final String image;

  factory Image.fromJson(Map<String, dynamic> json) => Image(
    id: json["id"] == null ? null : json["id"],
    image: json["image"] == null ? null : json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "image": image == null ? null : image,
  };
}
