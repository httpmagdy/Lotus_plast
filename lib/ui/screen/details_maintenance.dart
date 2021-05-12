import 'package:flutter/material.dart';

import '../../Bloc/models/home_customer_tabs_model.dart';
import '../../helpers/screen_helper.dart';
import '../../utils/constants.dart';
import '../widget/custom_appBar.dart';
import '../widget/custom_text.dart';

class DetailsMaintenance extends StatelessWidget {
  final Allprview data;

  DetailsMaintenance(this.data);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context: context, isHome: false),
      body: ListView(
        padding: const EdgeInsets.all(15.0),
        // crossAxisAlignment: CrossAxisAlignment.start,
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

          data.image == null
              ? Container()
              : CustomText(
                  padding: EdgeInsets.only(left: 15, top: 20, bottom: 16),
                  text: 'صوره للعطل',
                  fontW: FW.bold,
                  fontSize: ScreenHelper.screenFont(context, 13),
                ),

          data.image == null
              ? Container()
              : ClipRRect(
                  child: Image.network(
                    data.image,
                    loadingBuilder: (BuildContext context, Widget child,
                        ImageChunkEvent loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Container(
                        color: ConstColors.ULTRA_GREY_COLOR,
                        width: ScreenHelper.screenSize(context).width,
                        height: 200,
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                ConstColors.ORANGE_COLOR,
                              ),
                              strokeWidth: 2,
                              value: loadingProgress.expectedTotalBytes != null
                                  ? loadingProgress.cumulativeBytesLoaded /
                                      loadingProgress.expectedTotalBytes
                                  : null,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
        ],
      ),
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
