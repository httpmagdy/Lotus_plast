import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../Bloc/models/sliderAddsModel.dart';
import '../../helpers/screen_helper.dart';

class SliderAdds extends StatelessWidget {
  final double height;
  final List<SliderElement> slider;
  SliderAdds({
    this.height,
    this.slider,
  });
  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      options: CarouselOptions(
        height: height ?? ScreenHelper.screenHeight(context, 135.0),
        // aspectRatio: 16/9,
        viewportFraction: 0.7,
        initialPage: 0,
        enableInfiniteScroll: true,
        reverse: false,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 3),
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        enlargeCenterPage: true,
        // onPageChanged: callbackFunction,
        scrollDirection: Axis.horizontal,
      ),
      itemCount: slider?.length,
      itemBuilder: (context, index, realIndex) => AspectRatio(
        aspectRatio: 3,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: Image.network(
            slider[index].image,
// height: 60,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
