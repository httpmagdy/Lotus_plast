import 'package:flutter/material.dart';
import 'package:lotus/helpers/screen_helper.dart';
import 'package:get/get.dart';
import 'package:lotus/ui/screen/Notification/notification_screen.dart';

AppBar customAppBar({
  // String title,
  Function onPressed,
  bool transparent = false,
  bool isHome = true,
  context,

  // bool customBackButton = false,
}) {
  return AppBar(
    elevation: 6,
    toolbarHeight: ScreenHelper.screenHeight(context, 70),
    leading: Center(
      child: Builder(
        builder: (context) => GestureDetector(
          onTap: isHome
              ? () {
                  Scaffold.of(context).openDrawer();
                }
              : () {
                  Get.back();
                },
          child: Container(
            height: ScreenHelper.screenHeight(context, 27),
            width: ScreenHelper.screenWidth(context, 27),
            child: Image.asset(
              isHome
                  ? 'assets/img/icons/menu.png'
                  : 'assets/img/icons/Backicon.png',
            ),
          ),
        ),
      ),
    ),

    title: Image.asset(
      "assets/img/logo.png",
      height: ScreenHelper.screenHeight(context, 50),
      width: ScreenHelper.screenWidth(context, 50),
    ),
    actions: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: InkWell(
          highlightColor: Colors.transparent,
          hoverColor: Colors.transparent,
          focusColor: Colors.transparent,
          splashColor: Colors.transparent,
          onTap: () {
            Get.to(NotificationScreen());
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Image.asset(
              "assets/img/icons/notifcationIcon.png",
              height: ScreenHelper.screenHeight(context, 24),
              width: ScreenHelper.screenWidth(context, 24),
            ),
          ),
        ),
      )
    ],
    centerTitle: true,
    backgroundColor: transparent ? Colors.transparent : Colors.white,
    // elevation: 0,
  );
}

// class CustomBackButton extends StatelessWidget {
//   const CustomBackButton({Key key, this.color, this.onPressed})
//       : super(key: key);

//   final Color color;

//   final Function onPressed;

//   @override
//   Widget build(BuildContext context) {
//     assert(debugCheckHasMaterialLocalizations(context));
//     return IconButton(
//       padding: EdgeInsets.all(0),
//       alignment: Alignment.center,
//       icon: Container(
//         alignment: Alignment.center,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(50),
//           color: Color(0xffC2DEFA),
//         ),
//         width: 33,
//         height: 33,
//         child: Padding(
//           padding: const EdgeInsets.only(right: 5),
//           child: Icon(Icons.arrow_back_ios, size: 18),
//         ),
//       ),
//       color: color ?? SECONDRY_COLOR,
//       tooltip: MaterialLocalizations.of(context).backButtonTooltip,
//       onPressed: () {
//         if (onPressed != null) {
//           onPressed();
//         } else {
//           Navigator.maybePop(context);
//         }
//       },
//     );
//   }
// }
