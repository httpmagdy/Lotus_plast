import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../Bloc/models/home_inspector_model.dart';
import '../../../helpers/screen_helper.dart';
import '../../../utils/constants.dart';
import '../../globalWidget/rating_bar_w.dart';
import '../../widget/custom_appBar.dart';
import '../../widget/custom_button.dart';
import '../../widget/custom_text.dart';

class DetailsInspectorPreview extends StatelessWidget {
  // final SendRatePreviewProvider _sendRatePreviewProvider =
  //     Get.put(SendRatePreviewProvider());

  // final HomeInspectorProvider _homeInspectorProvider =
  //     Get.put(HomeInspectorProvider());

  final Complete data;
  DetailsInspectorPreview(this.data);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context: context, isHome: false),
      body: SingleChildScrollView(
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
                  data.isRating
                      ? RatingBarWidget(
                          rate: data.rate,
                        )
                      : Container(),
                ],
              ),

              RowTextAndText(
                title: 'رقم السباك',
                name: '${data.pulmberPhone}',
              ),
              data.customerName == null
                  ? Container()
                  : RowTextAndText(
                      title: 'اسم العميل',
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
                      title: 'رقم الهاتف 2',
                      name: '${data.customerPhone2}',
                    ),

              // Row(
              //   // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     RowTextAndText(
              //       title: 'تاريخ الاضافه',
              //       name: '${data.addedDate}',
              //     ) ,
              //     RowTextAndText(
              //       title: '     /',
              //       name: '${data.time}',
              //     ),
              //   ],
              // ),
              // Row(
              //   // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     RowTextAndText(
              //       title: 'تاريخ الانتهاء',
              //       name: '${data.date}',
              //     ),
              //     RowTextAndText(
              //       title: '     /',
              //       name: '${data.addedTime}',
              //     ),
              //   ],
              // ),

              RowTextAndText(
                title: 'تاريخ الاضافه',
                name: '${data.addedDate}',
              ),
              RowTextAndText(
                title: 'وقت الاضافه',
                name: '${data.time}',
              ),
              RowTextAndText(
                title: 'تاريخ المعاينه',
                name: '${data.date}',
              ),
              RowTextAndText(
                title: 'وقت المعاينه',
                name: '${data.addedTime}',
              ),

              RowTextAndText(
                isAddress: true,
                title: 'العنوان',
                name: '${data.address}',
              ),

              RowTextAndText(
                title: 'حاله الطلب',
                name:
                    '${data.statusActive == 0 ? "قيد التقديم" : "تم الاصلاح"}',
              ),

              CustomText(
                padding: EdgeInsets.only(left: 15, top: 20, bottom: 8),
                text: 'وصف العطل',
                fontW: FW.bold,
                fontSize: ScreenHelper.screenFont(context, 13),
              ),
              CustomText(
                padding: EdgeInsets.only(left: 15),
                text: '${data.description}',
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
            ],
          ),
        ),
      ),
    );
  }
}

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

class RatingDialog extends StatelessWidget {
  final onTap;
  final rating;
  RatingDialog({this.onTap, this.rating});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 30),
        width: double.infinity,
        // height: 400,
        // padding: EdgeInsets.symmetric(vertical: 25, horizontal: 25),
        height: ScreenHelper.screenSize(context).height * .7,
        child: Material(
          borderRadius: BorderRadius.circular(25),
          child: Column(
            children: [
              SizedBox(height: ScreenHelper.screenHeight(context, 25)),
              Image.asset(
                'assets/img/cobone.png',
                width: ScreenHelper.screenHeight(context, 150),
                // height: 200,
              ),
              SizedBox(height: ScreenHelper.screenHeight(context, 30)),
              CustomText(
                text: 'لقد تمت المعاينه بنجاح',
                fontSize: ScreenHelper.screenFont(context, 20),
              ),
              SizedBox(height: ScreenHelper.screenHeight(context, 30)),
              RatingBar.builder(
                initialRating: 3,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemSize: 35,
                itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: rating,
              ),
              SizedBox(height: ScreenHelper.screenHeight(context, 20)),
              CustomText(text: 'من فضلك قم بتقييم المعاينه'),
              Spacer(),
              SimpleCustomButton(
                bgColor: ConstColors.GREEN_COLOR,
                text: 'تقييم المعاينه',
                onTap: onTap,
              ),
              SizedBox(height: ScreenHelper.screenHeight(context, 25)),
            ],
          ),
        ),
      ),
    );
  }
}
