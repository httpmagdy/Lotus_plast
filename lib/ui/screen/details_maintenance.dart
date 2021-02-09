


import 'package:flutter/material.dart';
import 'package:lotus/helpers/screen_helper.dart';
import 'package:lotus/ui/widget/custom_appBar.dart';
import 'package:lotus/ui/widget/custom_text.dart';
import 'package:lotus/utils/constants.dart';
import '../../Bloc/models/home_customer_tabs_model.dart';

class DetailsMaintenance extends StatelessWidget {
  final  data;
  DetailsMaintenance(this.data);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context: context, isHome: false),
      body: Container(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              padding: const EdgeInsets.only(bottom: 35, top: 10),
              text: 'تفاصيل العطل',
              fontSize: ScreenHelper.screenFont(context, 21),
              fontW: FW.bold,
            ),
            // RowTextAndText(
            //   padding: EdgeInsets.all(0.0),
            //   title: 'اسم المعاين',
            //   name: '${data.customerName}',
            // ),
            // const SizedBox(height: 20),
            // RowTextAndText(
            //   title: 'حجز المعاينة',
            //   name: '${data.date}',
            // ),
            RowTextAndText(
              title: 'اسم العميل',
              name: '${data.customerName}',
            ),
            // RowTextAndText(
            //   title: 'رقم الهاتف',
            //   name: '${data.customerPhone}',
            // ),
            RowTextAndText(
              title: 'نوع العطل',
              name: '${data.damageType}',
            ),
            RowTextAndText(
              title: 'تاريخ الاضافه',
              name: '${data.addedDate}',
            ),
            RowTextAndText(
              title: 'الوقت',
              name: '${data.addedTime}',
            ),
            RowTextAndText(
              title: 'حاله الطلب',
              name: '${data.statusActive == 0 ? "قيد التقديم" : "تم الاصلاح"}',
            ),
            CustomText(
              padding: EdgeInsets.only(left: 15, top: 20, bottom: 8),
              text: 'وصف العطل',
              fontW: FW.bold,
              fontSize: ScreenHelper.screenFont(context, 13),
            ),
            CustomText(
              padding: EdgeInsets.only(left: 15),
              text: '${data.message}',
              fontSize: ScreenHelper.screenFont(context, 13),
            ),
          ],
        ),
      ),
    );
  }
}

class StarsWidget extends StatelessWidget {
  const StarsWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.star_border, size: 13, color: ConstColors.ORANGE_COLOR),
        Icon(Icons.star_border, size: 13, color: ConstColors.ORANGE_COLOR),
        Icon(Icons.star, size: 13, color: ConstColors.ORANGE_COLOR),
        Icon(Icons.star, size: 13, color: ConstColors.ORANGE_COLOR),
        Icon(Icons.star, size: 13, color: ConstColors.ORANGE_COLOR),
      ],
    );
  }
}

class RowTextAndText extends StatelessWidget {
  final String title, name;
  final padding;
  const RowTextAndText({
    Key key,
    this.name,
    this.title,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.only(bottom: 20),
      child: Row(
        children: [
          SizedBox(
            width: ScreenHelper.screenWidth(context, 90),
            child: CustomText(
              padding: EdgeInsets.only(left: 15),
              text: title,
              fontW: FW.bold,
              fontSize: ScreenHelper.screenFont(context, 13),
            ),
          ),
          CustomText(
            text: name,
            fontSize: ScreenHelper.screenFont(context, 13),
          ),
        ],
      ),
    );
  }
}
