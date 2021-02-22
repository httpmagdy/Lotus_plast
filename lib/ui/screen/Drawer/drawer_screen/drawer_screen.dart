import 'package:flutter/material.dart';
import 'package:lotus/helpers/screen_helper.dart';
import 'package:lotus/ui/screen/Static_Screens/about_screen/about_screen.dart';
import 'package:lotus/ui/screen/Static_Screens/call_us_screen/call_us_screen.dart';
import 'package:lotus/ui/screen/Static_Screens/certificates_screen/Certificates_screen.dart';
import 'package:lotus/ui/screen/Static_Screens/plivacy_screen/plivacy_screen.dart';
import 'package:lotus/ui/screen/Static_Screens/terms_of_warranty_screen/Terms_of_warranty_screen.dart';
import 'package:lotus/ui/widget/custom_text.dart';
import 'package:get/get.dart';
import '../../auth_Screens/welcome_screen.dart';
import '../../../../Bloc/Controllers/logout_provider.dart';

class EndDrawer extends StatelessWidget {
  // final GetStorage logged = GetStorage();

  @override
  Widget build(BuildContext context) {
    // var llll = logged.read('typeUser');
    // print('LLLLLLLLLLLLLLL $llll');
    return Stack(
      children: [
        ClipPath(
          clipper: _DrawerClipper(),
          child: Container(
            color: Colors.green,
            child: Drawer(
              child: Container(
                color: Color(0xFFFC8400),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // SizedBox(
                    //   height: 50,
                    // ),
                    TabisDrawer(
                      icon: "assets/img/icons/aicon1.png",
                      text: "الشروط والاحكام",
                      sizePadding: -10,
                      press: null,
                    ),
                    SizedBox(
                      height: ScreenHelper.screenHeight(context, 60),
                    ),
                    TabisDrawer(
                      icon: "assets/img/icons/aicon2.png",
                      text: "الشهادات",
                      sizePadding: 18,
                      press: () {
                        Get.to(
                          CertificatesScreen(),
                        );
                      },
                    ),
                    SizedBox(
                      height: ScreenHelper.screenHeight(context, 60),
                    ),
                    TabisDrawer(
                      icon: "assets/img/icons/aicon3.png",
                      text: "اتصل بنا",
                      sizePadding: 53,
                      press: () => Get.to(CallUsScreen(),
                          transition: Transition.leftToRight,
                          duration: Duration(milliseconds: 100)),
                    ),
                    SizedBox(
                      height: ScreenHelper.screenHeight(context, 60),
                    ),
                    TabisDrawer(
                      icon: "assets/img/icons/aicon4.png",
                      text: "نبذه عنا",
                      sizePadding: 63,
                      press: () => Get.to(AboutScreen(),
                          transition: Transition.leftToRight,
                          duration: Duration(milliseconds: 100)),
                    ),
                    SizedBox(
                      height: ScreenHelper.screenHeight(context, 60),
                    ),
                    TabisDrawer(
                      icon: "assets/img/icons/aicon5.png",
                      text: "شروط الضمان",
                      sizePadding: 53,
                      press: () {
                        Get.to(TermsOfWarrantyScreen());
                      },
                    ),
                    SizedBox(
                      height: ScreenHelper.screenHeight(context, 60),
                    ),
                    TabisDrawer(
                      icon: "assets/img/icons/aicon6.png",
                      text: "سياسه الخصوصيه",
                      sizePadding: 18,
                      press: () => Get.to(
                        PlivacyScreen(),
                        // transition: Transition.leftToRight,
                        // duration: Duration(milliseconds: 100)
                      ),
                    ),
                    SizedBox(
                      height: ScreenHelper.screenHeight(context, 60),
                    ),
                    GetBuilder<LogoutProvider>(
                      init: LogoutProvider(),
                      builder: (controller) => TabisDrawer(
                        icon: "assets/img/icons/aicon7.png",
                        text: "تسجيل الخروج",
                        sizePadding: -10,
                        press: () async {
                          await controller.logout().whenComplete(() {
                            Get.offAll(WelcomeScreen());
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        ClipPath(
          clipper: _MiniDrawerClipper(),
          child: Container(
            child: Drawer(
              child: Container(
                color: Color(0xFFFDC88D),
                child: Padding(
                  padding: EdgeInsets.only(
                    right: ScreenHelper.screenWidth(context, 22),
                  ),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          child: GestureDetector(
                            onTap: () {
                              Get.back();
                            },
                            child: Icon(
                              Icons.close,
                              color: Color(0xFFFDC88D),
                            ),
                          ),
                          radius: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class TabisDrawer extends StatelessWidget {
  final String icon;
  final String text;
  final double sizePadding;
  final Function press;

  const TabisDrawer({
    @required this.icon,
    @required this.text,
    this.sizePadding,
    @required this.press,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          right: ScreenHelper.screenWidth(context, 30 + sizePadding)),
      child: GestureDetector(
        onTap: press,
        child: Container(
          height: ScreenHelper.screenHeight(context, 19),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                icon,
                height: ScreenHelper.screenHeight(context, 15),
                width: ScreenHelper.screenWidth(context, 15),
              ),
              SizedBox(
                width: ScreenHelper.screenWidth(context, 13),
              ),
              CustomText(
                text: text,
                textAlign: TextAlign.end,
                color: Colors.white,
                fontSize: 11,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _DrawerClipper extends CustomClipper<Path> {
  // static final routName = "Drawer_clipper";
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(280, 0);
    path.quadraticBezierTo(-100, size.height / 2, 280, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}

class _MiniDrawerClipper extends CustomClipper<Path> {
  // static final routName = "Drawer_clipper";
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(600, 0);
    path.quadraticBezierTo(-150, size.height / 2, 600, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
