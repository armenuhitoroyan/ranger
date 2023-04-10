import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ranger/config/colors.dart';
import 'package:ranger/config/maps/map_time.dart';
import 'package:ranger/config/str.dart';
import 'package:ranger/pages/automations/pickers/timer_provider.dart';
import 'package:ranger/pages/automations/pickers/widgets/after_before.dart';
import 'package:ranger/pages/automations/pickers/widgets/hours.dart';
import 'package:ranger/pages/automations/pickers/widgets/minuts.dart';

import 'package:ranger/pages/automations/pickers/widgets/timer.dart';
import 'package:ranger/pages/automations/pickers/widgets/weekdays.dart';

class DatePicker extends StatelessWidget {
  int i = 0;
  @override
  Widget build(BuildContext context) {
    return _buildContent(context);
  }

  Widget _buildContent(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TimeProvider(),
      child: Scaffold(
        backgroundColor: RangerColors.white,
        body: Consumer<TimeProvider>(
          builder: (context, value, child) => Column(
            children: [
              WeekDays(),
              Padding(
                padding: const EdgeInsets.only(top: 0),
                child: Row(
                  children: const [
                    Text(RangerTexts.chooseTimer),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: value.listDAtes.length,
                  itemBuilder: (context, index) => Column(
                    children: [
                      Row(
                        children: [
                          Row(
                            children: [
                              IconButton(
                                  onPressed: () {
                                    value.onpressed();
                                    value.getValue(index);
                                    value.i = index;
                                    value.onVisibleTime();
                                    value.isVisible = !value.isVisible;
                                    MapTime.apm = value.i != 2 ? false : true;
                                  },
                                  icon:
                                      value.i == index && value.color == 'blue'
                                          ? const Icon(
                                              Icons.task_alt_outlined,
                                              color: RangerColors.lightBlue,
                                            )
                                          : const Icon(
                                              Icons.circle_outlined,
                                              color: RangerColors.black,
                                            )),
                              Icon(
                                value.listIcons[index],
                                color: value.i == index && value.color == 'blue'
                                    ? RangerColors.lightBlue
                                    : RangerColors.black,
                              ),
                            ],
                          ),
                          Expanded(
                            child: SizedBox(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: Text(
                                  value.listDAtes[index],
                                  style: TextStyle(
                                    color: value.i == index &&
                                            value.color == 'blue'
                                        ? RangerColors.lightBlue
                                        : RangerColors.black,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Visibility(
                        visible: value.i == index && value.color == 'blue'
                            ? value.isVisible
                            : false,
                        child: Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 1.5, right: 1.5),
                                child: TimerWidget(),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
