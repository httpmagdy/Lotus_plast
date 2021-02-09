class Slider {
  Slider({
    this.status,
    this.slider,
  });

  final bool status;
  final List<SliderElement> slider;

  factory Slider.fromJson(Map<String, dynamic> json) => Slider(
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
