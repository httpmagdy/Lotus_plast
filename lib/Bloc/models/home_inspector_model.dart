class HomeInspectorModel {
  HomeInspectorModel({
    this.slider,
    this.stillpreviews,
    this.complete,
  });

  final List<Complete> slider;
  final List<Complete> stillpreviews;
  final List<Complete> complete;

  factory HomeInspectorModel.fromJson(Map<String, dynamic> json) =>
      HomeInspectorModel(
        slider: json["slider "] == null
            ? null
            : List<Complete>.from(
                json["slider "].map((x) => Complete.fromJson(x))),
        stillpreviews: json["stillpreviews"] == null
            ? null
            : List<Complete>.from(
                json["stillpreviews"].map((x) => Complete.fromJson(x))),
        complete: json["complete"] == null
            ? null
            : List<Complete>.from(
                json["complete"].map((x) => Complete.fromJson(x))),
      );
}

class Complete {
  Complete({
    this.id,
    this.customerName,
    this.customerPhone,
    this.customerPhone2,
    this.address,
    this.addedDate,
    this.addedTime,
    this.pulmberName,
    this.pulmberPhone,
    this.date,
    this.time,
    this.rate,
    this.description,
    this.image,
    this.statusActive,
    this.isRating,
  });

  final int id;
  final String customerName;
  final String customerPhone;
  final String customerPhone2;
  final String address;
  final String addedDate;
  final String addedTime;
  final String pulmberName;
  final String pulmberPhone;
  final String date;
  final String time;
  final dynamic rate;
  final String description;
  final String image;
  final int statusActive;
  final bool isRating;

  factory Complete.fromJson(Map<String, dynamic> json) => Complete(
        id: json["id"] == null ? null : json["id"],
        customerName:
            json["customer_name"] == null ? null : json["customer_name"],
        customerPhone:
            json["customer_phone"] == null ? null : json["customer_phone"],
        customerPhone2:
            json["customer_phone2"] == null ? null : json["customer_phone2"],
        address: json["address"] == null ? null : json["address"],
        addedDate: json["added_date"] == null ? null : json["added_date"],
        addedTime: json["added_time"] == null ? null : json["added_time"],
        pulmberName: json["pulmber_name"] == null ? null : json["pulmber_name"],
        pulmberPhone:
            json["pulmber_phone"] == null ? null : json["pulmber_phone"],
        date: json["date"] == null ? null : json["date"],
        time: json["time"] == null ? null : json["time"],
        rate: json["rate"] == null ? null : double.parse('${json["rate"]}'),
        description: json["description"] == null ? null : json["description"],
        image: json["image"] == null ? null : json["image"],
        statusActive:
            json["status_active"] == null ? null : json["status_active"],
        isRating: json["is_rating"] == null ? null : json["is_rating"],
      );
}
