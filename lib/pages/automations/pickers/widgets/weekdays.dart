import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ranger/pages/automations/pickers/timer_provider.dart';

import '../../../../config/colors.dart';
import '../../../../config/maps/map_time.dart';

class WeekDays extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _buildContent();
  }

  Widget _buildContent() {
    return ChangeNotifierProvider(
      create: (context) => TimeProvider(),
      child: Consumer<TimeProvider>(
        builder: (context, value, child) => SizedBox(
          height: 50,
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: value.weekDays.length),
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(left: 1.5, right: 1.5,),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(45),
                      color: RangerColors.white,
                      border: Border.all(color: RangerColors.black)),
                  child: Center(
                    child: TextButton(
                      onPressed: () {
                        // print(value.weekDays[index]);
                        MapTime.map['weekday'] = value.weekDays[index];
                      },
                      child: Text(
                        value.weekDays[index],
                        style: const TextStyle(color: RangerColors.black),
                      ),
                    ),
                  ),
                ),
              );
            },
            itemCount: value.weekDays.length,
          ),
        ),
      ),
    );
  }
}