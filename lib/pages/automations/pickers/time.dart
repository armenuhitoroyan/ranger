import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ranger/config/colors.dart';
import 'package:ranger/pages/automations/pickers/timer_provider.dart';
import 'package:ranger/pages/automations/pickers/widgets/timer.dart';

import '../../../config/maps/map_time.dart';


class TimePicker extends StatelessWidget {
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
        body: 
        Consumer<TimeProvider>(
          builder: (context, value, child) => ListView.builder(
            itemCount: value.list.length,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              value.onpressed();
                              value.i = index;
                              value.onVisibleTime();
                              value.setIndex();
                              value.isVisible = !value.isVisible;
                              MapTime.hour = value.i != 2 ? false : true;
                            },
                            icon: value.i == index && value.color == 'blue'
                                ? const Icon(
                                    Icons.task_alt_outlined,
                                    color: RangerColors.lightBlue,
                                  )
                                : const Icon(
                                    Icons.circle_outlined,
                                    color: RangerColors.black,
                                  )),
                        Text(value.list[index]),
                      ],
                    ),
                    Visibility(
                        visible: value.i == index && value.color == 'blue'
                            ? value.isVisible
                            : false,
                        child: SizedBox(
                          width: double.infinity,
                          child: TimerWidget(),
                        ))
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
