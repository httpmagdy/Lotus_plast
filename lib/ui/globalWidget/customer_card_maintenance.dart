import 'package:flutter/material.dart';
import 'package:lotus/helpers/screen_helper.dart';
import 'package:lotus/ui/globalWidget/row_icon_text.dart';
import 'package:lotus/ui/globalWidget/status.dart';
import 'package:lotus/ui/screen/details_preview.dart';
import 'package:lotus/ui/widget/custom_dialog.dart';
import 'package:lotus/utils/constants.dart';
import '../../Bloc/models/home_customer_tabs_model.dart';
import 'package:lotus/ui/widget/custom_text.dart';

class CardCustomerMaintenance extends StatelessWidget {
  final onTap;
  final Allprview data;

  const CardCustomerMaintenance({
    Key key,
    this.onTap,
    this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var activation = data.statusActive;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        margin: const EdgeInsets.symmetric(horizontal: 15),
        width: ScreenHelper.screenSize(context).width,
        // height: ScreenHelper.screenHeight(context, 150),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: ConstColors.BG_CARD_CUSTOMER,
          // border: Border.all(width: 0.8, color: Colors.grey.shade300),
        ),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ClipRRect(
              child: Image.asset(
                'assets/img/ccc.png',
                width: ScreenHelper.screenWidth(context, 55),
                height: ScreenHelper.screenHeight(context, 55),
              ),
            ),
            const SizedBox(width: 5),
            Expanded(
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RowIconText(
                        iconName: 'user',
                        text: '${data.customerName}',
                        textColor: ConstColors.TEXT_GREY2,
                      ),
                      SizedBox(height: 4),
                      RowIconText(
                        iconName: 'time',
                        text:'${data.addedTime}',
                        textColor: ConstColors.TEXT_GREY2,
                      ) ,
                    ],
                  ),
                  // const SizedBox(width: 80),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      activation == 0 ? StatusW(activation) : StatusW(activation),
                      const SizedBox(height: 4),
                      RowIconText(
                        iconName: 'calendar',
                        text: '${data.addedDate}',
                        textColor: ConstColors.TEXT_GREY2,
                      ),
                    ],
                  ),

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
