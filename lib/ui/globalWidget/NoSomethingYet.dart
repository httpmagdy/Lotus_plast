import 'package:flutter/material.dart';
import 'package:lotus/ui/widget/custom_text.dart';
import 'package:lotus/utils/constants.dart';

class NoSomethingYet extends StatelessWidget {
  final  String title;
  NoSomethingYet({this.title});

  @override
  Widget build(BuildContext context) {
    return Container(alignment: Alignment.center, padding: const EdgeInsets.only(top: 20), child: CustomText(text: '$title', fontSize: 10,color: ConstColors.GREY_COLOR,),);
  }
}
