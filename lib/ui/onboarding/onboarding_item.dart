import 'package:flutter/material.dart';
import '../../utils/constants.dart';
import '../../helpers/screen_helper.dart';
import '../../ui/widget/square_image_container.dart';
import 'onboarding_model.dart';

class OnBoardingItem extends StatelessWidget {
  int index;

  OnBoardingItem({this.index});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: ScreenHelper.screenHeight(context, 150),
        ),
        SquareImageContainer(
          size: 200.0,
          image: AssetImage(onBoardingLists[index].image),
        ),
        SizedBox(
          height: ScreenHelper.screenHeight(context, 40),
        ),
        Text(
          onBoardingLists[index].title,
          textAlign: TextAlign.center,
          textDirection: TextDirection.rtl,
          style: Theme.of(context).textTheme.headline1.copyWith(
                fontSize: ScreenHelper.screenFont(context, 20),
                color: ConstColors.BLACK_COLOR,
              ),
        ),
        SizedBox(
          height: ScreenHelper.screenHeight(context, 5),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: ScreenHelper.screenWidth(context, 34)),
          child: Text(
            onBoardingLists[index].subtitle,
            textAlign: TextAlign.center,
            textDirection: TextDirection.rtl,
            style: Theme.of(context).textTheme.subtitle1.copyWith(
                  fontSize: ScreenHelper.screenFont(context, 15),
                  color: ConstColors.GREY_COLOR,
                ),
          ),
        ),
      ],
    );
  }
}
