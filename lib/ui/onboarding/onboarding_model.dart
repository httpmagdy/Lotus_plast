import 'package:flutter/material.dart';

class OnBoardingModel {
  int id;
  String image;
  String title;
  String subtitle;

  OnBoardingModel({this.id, this.image, this.title, this.subtitle});
}

List<OnBoardingModel> onBoardingLists = [
  OnBoardingModel(
      id: 0,
      title: "معاينة مجانية",
      subtitle:
          "هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص",
      image: "assets/img/tab1.png"),
  OnBoardingModel(
      id: 1,
      title: "بدل كوبوناتك",
      subtitle:
          "هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص",
      image: "assets/img/tab2.png"),
  OnBoardingModel(
      id: 2,
      title: "لماذا نحن",
      subtitle:
          "هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص",
      image: "assets/img/tab3.png"),
  OnBoardingModel(
      id: 3,
      title: "خدمة ما بعد البيع",
      subtitle:
          "هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص",
      image: "assets/img/tab4.png"),
];
