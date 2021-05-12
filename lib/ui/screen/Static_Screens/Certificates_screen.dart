import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Bloc/Controllers/Certificates_provider.dart';
import '../../globalWidget/custom_loading.dart';
import '../../widget/custom_appBar.dart';
import '../../widget/custom_text.dart';

class CertificatesScreen extends StatelessWidget {
  final CertificatesProvider _provider = Get.put(CertificatesProvider());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        context: context,
        onPressed: () {},
        transparent: false,
        isHome: false,
      ),
      body: GetX<CertificatesProvider>(
        builder: (controller) => _provider.loading.value
            ? CustomLoading(bg: Colors.white)
            : Column(
                children: [
                  CustomText(
                    text: "الشهادات",
                    fontW: FW.bold,
                    fontSize: 20,
                    textAlign: TextAlign.center,
                    padding: EdgeInsets.only(bottom: 40, top: 25),
                  ),
                  Expanded(
                    child: GridView.builder(
                      physics: BouncingScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisSpacing: 2,
                        crossAxisSpacing: 2,
                        crossAxisCount: 2,
                        childAspectRatio: 2,
                      ),
                      itemCount: controller.images.length,
                      itemBuilder: (context, index) =>
                          Image.network(controller.images[index].image),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
