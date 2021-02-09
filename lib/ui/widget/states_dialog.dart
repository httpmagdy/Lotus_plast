
import 'package:flutter/material.dart';
import 'package:lotus/helpers/screen_helper.dart';
import 'package:lotus/ui/widget/custom_button.dart';

import 'custom_text.dart';

class StatesDialog extends StatefulWidget {
  final List states;
  final Function onSave;
  final String title;
  StatesDialog({this.states, this.onSave, this.title = "اختر"});

  @override
  _StatesDialogState createState() => _StatesDialogState();
}


class _StatesDialogState extends State<StatesDialog> {
  bool state = false;
  int _currentIndex = 0;
  int returnIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(15),

      child: SizedBox(
        width: ScreenHelper.screenSize(context).width * .8,
        height: ScreenHelper.screenSize(context).height * .7,

        child: Column(
          children: [
            SizedBox(
              height: ScreenHelper.screenHeight(context, 20),
            ),
            GestureDetector(
              onTap: () {
                // print(widget.states[0].title);
              },
              child: CustomText(
               text: widget.title,
                fontSize: ScreenHelper.screenFont(context, 20.0),
              ),
            ),
            SizedBox(
              height: ScreenHelper.screenHeight(context, 15),
            ),
            Expanded(
                child: Material(
                  color: Colors.transparent,
                  child: ListView(
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    // children: widget.statesCities
                    children: widget.states
                        .map((state) => RadioListTile(
                              activeColor: Colors.green,
                              groupValue: _currentIndex,
                              title: Text(
                                state.name,
                                textDirection: TextDirection.rtl,
                                style: Theme.of(context).textTheme.caption.copyWith(
                                      fontSize:
                                          ScreenHelper.screenFont(context, 15),
                                      fontFamily: 'sst',
                                    ),
                              ),
                              value: state.id,
                              onChanged: (val) {
                                print('VALLLLLL ::::: $val');
                                setState(() {
                                  _currentIndex = val;
                                  returnIndex = widget.states
                                      .indexWhere((element) => element.id == val);
                                });
                              },
                            ))
                        .toList(),
                  ),
                )),
            Padding(
              padding: EdgeInsets.only(
                  bottom: ScreenHelper.screenHeight(context, 20),
                  top: ScreenHelper.screenHeight(context, 20)),
              child: SimpleCustomButton(
                onTap: () {
//                widget.onSave(_currentIndex);
                  widget.onSave(returnIndex);
                },
                text: "حفظ",
                textColor: Colors.white,
                width: ScreenHelper.screenWidth(context, 150),
                height: ScreenHelper.screenHeight(context, 60),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
