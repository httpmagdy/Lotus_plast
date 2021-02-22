import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lotus/Bloc/Controllers/Gifts_Controller/exchange_gift_provider.dart';
import 'package:lotus/Bloc/Controllers/Gifts_Controller/get_gifts_provider.dart';
import 'package:lotus/Bloc/models/getgifts_model.dart' as giftModel;
import 'package:lotus/helpers/screen_helper.dart';
import 'package:lotus/ui/globalWidget/custom_loading.dart';
import 'package:lotus/ui/globalWidget/custom_snack_bar.dart';
import 'package:lotus/ui/widget/custom_appBar.dart';
import 'package:lotus/ui/widget/custom_dialog.dart';
import 'package:lotus/ui/widget/custom_text.dart';

import '../../../utils/constants.dart';
final ExchangeGiftProvider exchangeGiftProvider = Get.put(ExchangeGiftProvider());

class GiftsPage extends StatelessWidget {
  final GetGiftsProvider _getGiftsProvider = Get.put(GetGiftsProvider());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context: context, isHome: false),
      body: GetX<GetGiftsProvider>(
        builder: (controller) => controller.status.value == true ? CustomLoading(bg: Colors.white) : Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 30),
            Container(
              margin:
                  const EdgeInsets.only(left: 15, right: 15, bottom: 20, top: 5),
              padding:
                  const EdgeInsets.only(left: 25, right: 10, bottom: 15, top: 15),
              width: ScreenHelper.screenSize(context).width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: ConstColors.WHITE,
                // border: Border.all(width: 0.8, color: Colors.grey.shade300),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 8.0,
                    spreadRadius: 0.4,
                    offset: Offset(0.1, 2.4),
                    color: Color(0xff575757).withOpacity(0.16),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Image.asset(
                    'assets/img/gifthome.png',
                    width: ScreenHelper.screenWidth(context, 70),
                    height: ScreenHelper.screenHeight(context, 70),
                  ),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: 'عدد معايناتك',
                        fontSize: 11,
                      ),
                      CustomText(
                        text: '${_getGiftsProvider.nuOfMaintenance}   معاينة ',
                        fontSize: 12,
                        fontW: FW.bold,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    return CardGi(_getGiftsProvider.listOfGifts[index]);
                  },
                  physics: BouncingScrollPhysics(),
                  separatorBuilder: (context, index) => SizedBox(
                        height: 10,
                      ),
                  itemCount: _getGiftsProvider.listOfGifts.length),
            )
          ],
        ),
      ),
    );
  }
}

class CardGi extends StatelessWidget {
  final GetGiftsProvider _getGiftsProvider = Get.put(GetGiftsProvider());

  final giftModel.Gift gift;
  CardGi(this.gift);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 15, right: 15, bottom: 20, top: 5),
      padding: const EdgeInsets.only(left: 0, right: 10, bottom: 5, top: 5),
      width: ScreenHelper.screenSize(context).width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        // color: ConstColors.GREEN_COLOR,
        // border: Border.all(width: 0.8, color: Colors.grey.shade300),
        boxShadow: [
          BoxShadow(
            blurRadius: 8.0,
            spreadRadius: 0.4,
            offset: Offset(0.1, 2.4),
            color: Color(0xff575757).withOpacity(0.16),
          ),
        ],

        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [ConstColors.GREEN_COLOR, Color(0xff7DB210)],
        ),
      ),
      child: Row(
        children: [
          Image.asset(
            'assets/img/gifthome.png',
            width: ScreenHelper.screenWidth(context, 100),
            height: ScreenHelper.screenHeight(context, 100),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: 'هدايا المعاينات',
                fontSize: 11,
                color: ConstColors.WHITE,
              ),
              SizedBox(height: 10),
              CustomText(
                text: '${gift.number} معاينه ',
                fontSize: 12,
                fontW: FW.bold,
                color: ConstColors.WHITE,
              ),
            ],
          ),
          Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.6),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                ),
                width: ScreenHelper.screenWidth(context, 100),
                height: ScreenHelper.screenHeight(context, 33),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => Container(
                    width: 25,
                    height: 25,
                    child: Image.network(
                      '${gift.images[index].image}',
                      width: ScreenHelper.screenWidth(context, 33),
                      height: ScreenHelper.screenHeight(context, 33),
                    ),
                  ),
                  itemCount: gift.images.length,
                ),
              ),
              SizedBox(height: 10),

              FlatButton(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  // side: BorderSide(color: Colors.red)
                ),
                onPressed: () {
                  print('n1 :: ${_getGiftsProvider.nuOfMaintenance.value}');
                  print('gift :: ${gift.number}');
                  if(_getGiftsProvider.nuOfMaintenance.value < gift.number){
                    customSnackBar(title: 'لايمكنك الحصول علي هذه المكافئه', body: "عدد معايناتك (${_getGiftsProvider.nuOfMaintenance.value}) اقل من هذه المكافئه ");
                  }else{

                    Get.dialog(
                      DialogPoint(
                        title: '  قم باختيار هديتك ',
                        child: Center(child: Radio(gift)),
                        onTapOk: ()async {
                          await exchangeGiftProvider.exchangeGift().then((value) {
                            Get.back();
                            if(value.status == true){
                              Get.dialog(
                                OkDialog(
                                  title: ' تم اختيار هديتك بنجاح ',
                                  body: 'سيتم التواصل معك في خلال 24 ساعه ',
                                  image: 'assets/img/okicon.png',
                                  onTapOk: () {
                                    Get.back();
                                  },
                                ),
                              );
                            }else{
                              Get.dialog(
                                OkDialog(
                                  title: 'خطأ',
                                  body: '${value.message}',
                                  image: 'assets/img/okicon.png',
                                  onTapOk: () {
                                    Get.back();
                                  },
                                ),
                              );
                            }


                          });




                        },
                      ),
                    );
                  }


                },
                child: CustomText(
                  text: 'صرف المكافئة',
                  fontW: FW.bold,
                  fontSize: ScreenHelper.screenFont(context, 10),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Radio extends StatefulWidget {

  final giftModel.Gift gift;
  Radio(this.gift);

  @override
  _RadioState createState() => _RadioState();
}

class _RadioState extends State<Radio> {
  int _value = 0;

  @override
  Widget build(BuildContext context) {
    print('_value ::::::::  $_value');

    return Container(
      // alignment: Alignment.center,
      width: ScreenHelper.screenSize(context).width,
      height: 120,
      // color: Colors.red,
      padding: EdgeInsets.only(
        top: ScreenHelper.screenHeight(context, 45),
        bottom: ScreenHelper.screenHeight(context, 45),
        // right: 10, left:10,
      ),
      child: ListView.builder(
          padding: EdgeInsets.symmetric(horizontal: 10),
          scrollDirection: Axis.horizontal,
          itemCount: widget.gift.images.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () =>
                  setState(() {
                    _value = widget.gift.images[index].id;
                  exchangeGiftProvider.imageId.value = _value;

                  }),
              child: Container(
                width: ScreenHelper.screenWidth(context, 60),
                height: ScreenHelper.screenHeight(context, 60),
                margin: EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: _value == widget.gift.images[index].id
                        ? ConstColors.ORANGE_COLOR
                        : Color(0xffD3D3D3),
                  ),
                  image: DecorationImage(
                    image: NetworkImage(
                      '${widget.gift.images[index].image}',
                    ),
                    // fit: BoxFit.cover,
                  ),
                ),
              ),
            );
          }),

      // Row(
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   children: <Widget>[
      //     GestureDetector(
      //       onTap: () => setState(() => _value = 0),
      //       child: Container(
      //         decoration: BoxDecoration(
      //           borderRadius: BorderRadius.circular(15),
      //           border: Border.all(
      //               color: _value == 0
      //                   ? ConstColors.ORANGE_COLOR
      //                   : Color(0xffD3D3D3)),
      //         ),
      //         width: ScreenHelper.screenWidth(context, 60),
      //         height: ScreenHelper.screenHeight(context, 60),
      //         child: Image.asset(
      //           'assets/img/g2.png',
      //           width: ScreenHelper.screenWidth(context, 50),
      //           height: ScreenHelper.screenHeight(context, 50),
      //           // fit: BoxFit.fill,
      //         ),
      //       ),
      //     ),
      //     // SizedBox(width: ScreenHelper.screenWidth(context, 15)),
      //     // GestureDetector(
      //     //   onTap: () => setState(() => _value = 1),
      //     //   child: Container(
      //     //     decoration: BoxDecoration(
      //     //       borderRadius: BorderRadius.circular(15),
      //     //       border: Border.all(
      //     //           color: _value == 1
      //     //               ? ConstColors.ORANGE_COLOR
      //     //               : Color(0xffD3D3D3)),
      //     //     ),
      //     //     width: ScreenHelper.screenWidth(context, 60),
      //     //     height: ScreenHelper.screenHeight(context, 60),
      //     //     child: Image.asset(
      //     //       'assets/img/g1.png',
      //     //       width: ScreenHelper.screenWidth(context, 50),
      //     //       height: ScreenHelper.screenHeight(context, 50),
      //     //       // fit: BoxFit.fill,
      //     //     ),
      //     //   ),
      //     // ),
      //     // SizedBox(width: ScreenHelper.screenWidth(context, 15)),
      //     // GestureDetector(
      //     //   onTap: () => setState(() => _value = 2),
      //     //   child: Container(
      //     //     decoration: BoxDecoration(
      //     //       borderRadius: BorderRadius.circular(15),
      //     //       border: Border.all(
      //     //           color: _value == 2
      //     //               ? ConstColors.ORANGE_COLOR
      //     //               : Color(0xffD3D3D3)),
      //     //     ),
      //     //     width: ScreenHelper.screenWidth(context, 60),
      //     //     height: ScreenHelper.screenHeight(context, 60),
      //     //     child: Image.asset(
      //     //       'assets/img/g2.png',
      //     //       width: ScreenHelper.screenWidth(context, 50),
      //     //       height: ScreenHelper.screenHeight(context, 50),
      //     //       // fit: BoxFit.fill,
      //     //     ),
      //     //   ),
      //     // ),
      //   ],
      // ),
    );
  }
}
