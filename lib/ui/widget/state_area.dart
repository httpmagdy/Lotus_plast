import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lotus/Bloc/Controllers/Auth_Controllers/register.dart';
import 'package:lotus/Bloc/Controllers/get_status.dart';
import 'package:lotus/helpers/screen_helper.dart';

import 'custom_text_field.dart';
import 'states_dialog.dart';

class StateArea extends StatefulWidget {
  @override
  _StateAreaState createState() => _StateAreaState();
}

class _StateAreaState extends State<StateArea> {
  final RegisterProvider _registerProvider = Get.find();

  TextEditingController _stateController;
  TextEditingController _cityController;

  TextEditingController _stateIndex;

  @override
  void initState() {
    super.initState();
    _stateController = TextEditingController();
    _cityController = TextEditingController();
    _stateIndex = TextEditingController();
  }

  @override
  void dispose() {
    _stateController.dispose();
    _cityController.dispose();
    _stateIndex.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var node = FocusScope.of(context);

    return GetBuilder<StatusProvider>(
      builder: (controller) => Row(
        // textDirection: TextDirection.rtl,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: ScreenHelper.screenWidth(context, 140),
            child: GestureDetector(
              onTap: () {
                node.unfocus();
                Get.dialog(
                  Center(
                    child: StatesDialog(
                      title: "اختر المحافظة",
                      states: controller.stateFilter,
                      onSave: (value) {
                        Get.back();
                        setState(() {
                          _stateIndex.text = value.toString();
                          print(
                              "my state index equal to >> ${_stateIndex.text}");
                        });
                        _registerProvider.stateController.text =
                            controller.stateFilter[value].id.toString();
                        _stateController.text =
                            controller.stateFilter[value].name;
                        _cityController.clear();
                      },
                    ),
                  ),
                );
              },
              child: CustomTextField(
                enabled: false,
                hint: "المحافظة",
                errorMessage: "يجب اختيار المحافظة",
                // textInputAction: TextInputAction.next,
                keyboardType: TextInputType.phone,
                controller: _stateController,
                onComplete: () {
                  node.nextFocus();
                },
              ),
            ),
          ),
          SizedBox(
            width: ScreenHelper.screenWidth(context, 140),
            child: GestureDetector(
              onTap: () {
                Get.dialog(
                  Center(
                    child: StatesDialog(
                      title: "اختر المدينة",
                      states: controller
                          .stateFilter[int.parse(_stateIndex.text)].cities,
                      onSave: (value) {
                        Get.back();

                        _registerProvider.cityController.text = controller
                            .stateFilter[int.parse(_stateIndex.text)]
                            .cities[value]
                            .id
                            .toString();

                        _cityController.text = controller
                            .stateFilter[int.parse(_stateIndex.text)]
                            .cities[value]
                            .name;
//                                    _citySendController.text = value;
                      },
                    ),
                  ),
                );
              },
              child: CustomTextField(
                enabled: false,
                hint: "المدينة",
                errorMessage: "يجب اختيار المدينة",
                // textInputAction: TextInputAction.next,
                keyboardType: TextInputType.phone,
                controller: _cityController,
                onComplete: () {
                  node.nextFocus();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
