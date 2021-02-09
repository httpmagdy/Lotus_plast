
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lotus/Bloc/Controllers/Plumber/add_blumber_coupon_qr_provider.dart';
import 'package:lotus/helpers/screen_helper.dart';
import 'package:lotus/ui/widget/custom_text.dart';
import 'package:lotus/utils/constants.dart';

class RadioModel {
  final String title, subTitle;
  final int id;

  RadioModel({this.title, this.subTitle, this.id});
}

class RadioListBuilder extends StatefulWidget {

  final int nowPrice, laterPrice;
  RadioListBuilder({@required this.nowPrice,@required this.laterPrice});

  @override
  RadioListBuilderState createState() {
    return RadioListBuilderState();
  }
}

class RadioListBuilderState extends State<RadioListBuilder> {
  final AddPlumberCouponQrProvider _addPlumberCouponQrProvider =
  Get.put(AddPlumberCouponQrProvider());
  int value;

  @override
  Widget build(BuildContext context) {
    List<RadioModel> radioData = [
      RadioModel(title: 'الصرف الحالي', subTitle: 'سعر النقطة ${widget.nowPrice} ج.م', id: 0),
      RadioModel(title: 'النقاط المعلقة', subTitle: 'سعر النقطة ${widget.laterPrice} ج.م', id: 1),
    ];
    return ListView.builder(
      itemBuilder: (context, index) {
        return RadioListTile(
          activeColor: ConstColors.ORANGE_COLOR,
          value: index,
          groupValue: value,
          onChanged: (id) {
            setState(() {
              value = id;
              print('ind :::::  $id');
              _addPlumberCouponQrProvider.statusId.value = id;
              print('statusId === :::::  ${_addPlumberCouponQrProvider.statusId.value}');
            });
          },
          title: CustomText(
            text: radioData[index].title,
            fontSize: ScreenHelper.screenFont(context, 18),
            color: value == index
                ? ConstColors.ORANGE_COLOR
                : ConstColors.GREY_COLOR,
          ),
          subtitle: CustomText(
            text: radioData[index].subTitle,
            fontSize: ScreenHelper.screenFont(context, 12),
            color: value == index
                ? ConstColors.BLACK_COLOR
                : ConstColors.GREY_COLOR,
          ),
        );
      },
      itemCount: radioData.length,
    );
  }
}
