import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Bloc/Controllers/Inspector/send_rate_preview_preview.dart';
import '../../Bloc/models/home_customer_tabs_model.dart';
import '../../helpers/screen_helper.dart';
import '../../utils/constants.dart';
import '../globalWidget/rating_bar_w.dart';
import '../widget/custom_appBar.dart';
import '../widget/custom_button.dart';
import '../widget/custom_text.dart';
import 'Inspector/details_inspector_preview.dart';

class DetailsPreview extends StatelessWidget {
  final Allprview data;
  final onTapRate;
  DetailsPreview({this.data, this.onTapRate});
  final SendRatePreviewProvider _sendRatePreviewProvider = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context: context, isHome: false),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                padding: const EdgeInsets.only(bottom: 35, top: 10),
                text: 'تفاصيل المعاينه',
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

              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RowTextAndText(
                    title: 'اسم السباك',
                    name: '${data.pulmberName}',
                  ),
                  data.statusActive == 2
                      ? data.isRating
                          ? RatingBarWidget(
                              rate: data.rate,
                            )
                          : SimpleCustomButton(
                              text: "تقييم المعاينه",
                              onTap: () {
                                Get.dialog(
                                  RatingDialog(
                                      rating: (rating) {
                                        print("RRRRRRRRRRRR  ::::   $rating");
                                        _sendRatePreviewProvider.rate.value =
                                            rating;
                                      },
                                      onTap: onTapRate),
                                );
                              },
                              width: 95,
                              height: 25,
                              fontSize: ScreenHelper.screenFont(context, 11.0),
                            )
                      : Container(),
                ],
              ),
              RowTextAndText(
                title: 'رقم الهاتف',
                name: '${data.pulmberPhone}',
              ),
              data.customerName == null
                  ? Container()
                  : RowTextAndText(
                      title: 'اسم السباك',
                      name: '${data.customerName}',
                    ),
              data.customerName == null
                  ? Container()
                  : RowTextAndText(
                      title: 'رقم الهاتف',
                      name: '${data.customerPhone}',
                    ),

              data.customerPhone2 == null
                  ? Container()
                  : RowTextAndText(
                      title: 'رقم الهاتف',
                      name: '${data.customerPhone2}',
                    ),

              RowTextAndText(
                title: 'تاريخ الاضافه',
                name: '${data.addedDate}',
              ),
              RowTextAndText(
                title: 'وقت الاضافه',
                name: '${data.addedTime}',
              ),

              RowTextAndText(
                title: 'تاريخ المعاينه',
                name: '${data.date}',
              ),

              RowTextAndText(
                title: 'وقت المعاينه',
                name: '${data.time}',
              ),

              RowTextAndText(
                isAddress: true,
                title: 'العنوان',
                name: '${data.address}',
              ),

              RowTextAndText(
                title: 'حاله الطلب',
                name:
                    '${data.statusActive != 0 ? data.statusActive == 1 ? "تم تحديد الموعد" : "تمت بنجاح" : "قيد التقديم"}',
              ),

              // Text("${data.statusActive}  ;;;; "),

              data.message == null
                  ? Container()
                  : CustomText(
                      padding: EdgeInsets.only(left: 15, top: 20, bottom: 8),
                      text: 'وصف المعاينه',
                      fontW: FW.bold,
                      fontSize: ScreenHelper.screenFont(context, 13),
                    ),
              data.message == null
                  ? Container()
                  : CustomText(
                      padding: EdgeInsets.only(left: 15),
                      text: '${data.message}',
                      fontSize: ScreenHelper.screenFont(context, 13),
                    ),

              data.image == null
                  ? Container()
                  : CustomText(
                      padding: EdgeInsets.only(left: 15, top: 20, bottom: 16),
                      text: 'صوره للمعاينه',
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
                                  value: loadingProgress.expectedTotalBytes !=
                                          null
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

              // Image.network(data.image),
            ],
          ),
        ),
      ),
    );
  }
}

// class StarsWidget extends StatelessWidget {
//   const StarsWidget({
//     Key key,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Icon(Icons.star_border, size: 13, color: ConstColors.ORANGE_COLOR),
//         Icon(Icons.star_border, size: 13, color: ConstColors.ORANGE_COLOR),
//         Icon(Icons.star, size: 13, color: ConstColors.ORANGE_COLOR),
//         Icon(Icons.star, size: 13, color: ConstColors.ORANGE_COLOR),
//         Icon(Icons.star, size: 13, color: ConstColors.ORANGE_COLOR),
//       ],
//     );
//   }
// }

class RowTextAndText extends StatelessWidget {
  final String title, name;
  final padding;
  final isAddress;

  const RowTextAndText({
    Key key,
    this.name,
    this.title,
    this.padding,
    this.isAddress = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.only(bottom: 20),
      child: Row(
        children: [
          SizedBox(
            width: 80,
            child: CustomText(
              // padding: EdgeInsets.only(left: 15),
              text: title,
              fontW: FW.semibold,
              fontSize: ScreenHelper.screenFont(context, 13),
            ),
          ),
          !isAddress
              ? CustomText(
                  text: name,
                  fontSize: ScreenHelper.screenFont(context, 13),
                )
              : Column(
                  children: [
                    SizedBox(
                      width: ScreenHelper.screenSize(context).width * .65,
                      child: CustomText(
                        text: name,
                        fontSize: ScreenHelper.screenFont(context, 13),
                      ),
                    ),
                  ],
                ),
        ],
      ),
    );
  }
}
