// class SliderAddsM {
//   SliderAddsM({
//     this.image,
//     this.link,
//   });
//
//   final String image;
//   final String link;
//
//   // factory SliderAddsM.fromJson(Map<String, dynamic> json) => SliderAddsM(
//   //   image: json["IMAGE"],
//   //   link: json["LINK"],
//   // );
// }



class SliderAddsM {
  SliderAddsM({
    this.status,
    this.slider,
  });

  final bool status;
  final List<SliderElement> slider;

  factory SliderAddsM.fromJson(Map<String, dynamic> json) => SliderAddsM(
    status: json["status"] == null ? null : json["status"],
    slider: json["slider"] == null ? null : List<SliderElement>.from(json["slider"].map((x) => SliderElement.fromJson(x))),
  );

}

class SliderElement {
  SliderElement({
    this.image,
  });
  final String image;
  factory SliderElement.fromJson(Map<String, dynamic> json) => SliderElement(
    image: json["image"] == null ? null : json["image"],
  );
}
