import 'package:flutter/material.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';
import 'package:ranger/config/colors.dart';
import 'package:ranger/pages/automations/pickers/widgets/hours.dart';
import 'package:ranger/pages/automations/pickers/widgets/minuts.dart';

import '../../../../config/maps/map_time.dart';
import 'after_before.dart';

class TimerWidget extends StatefulWidget {
  @override
  State<TimerWidget> createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {
  var _dateTime;
   List<String> afterBefore = [
    'After',
    'Before',
  ];
  @override
  Widget build(BuildContext context) {
    return _buildContent();
  }

  Widget _buildContent() {
    return Row(
      children: [
       Expanded(
          child: SizedBox(
            height: 50,
            child: Padding(
              padding: const EdgeInsets.only(right: 1.5, top: 1, bottom: 1),
              child: Hours(),
            ),
          ),
        ),
        Expanded(
          child: SizedBox(
            height: 50,
            child: Padding(
              padding: const EdgeInsets.only(left: 1.5, right: 1.5),
              child: Minutes(),
            ),
          ),
        ),
        Visibility(
          visible: MapTime.date == true ? true : false,
          child: Expanded(
            child: SizedBox(
              height: 50,
              child: Padding(
                padding: const EdgeInsets.only(left: 1.5),
                child: AfterBefore(),
              ),
            ),
          ),
        ),
      ],
    );
    // return TimePickerSpinner(
    //   is24HourMode: false,
    //   isShowSeconds: false,
    //   itemWidth: 50.0,
    //   normalTextStyle: TextStyle(
    //       fontSize: 20,
    //       decorationThickness: 50.0,
    //       color: RangerColors.black,
    //       background: Paint()..color = RangerColors.white),
    //   highlightedTextStyle: TextStyle(
    //     fontSize: 20,
    //     color: RangerColors.white,
    //     background: Paint()..color = RangerColors.rowsBlue,
    //   ),
    //   spacing: 15,
    //   itemHeight: 30,
    //   isForce2Digits: true,
    //   alignment: Alignment.centerLeft,
    //   onTimeChange: (time) {
    //     setState(() {
    //       _dateTime = time;
    //     });
    //   },
    // );
  }
}
