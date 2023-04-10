import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ranger/pages/automations/pickers/timer_provider.dart';

class DaysContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _buildContent(context);
  }

  Widget _buildContent(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TimeProvider(),
      child: Consumer<TimeProvider>(
        builder: (context, value, child) =>
        GridView.builder(
          itemCount: value.weekDays.length,
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 7),
          itemBuilder: (context, index) => ElevatedButton(
            style: ElevatedButton.styleFrom(
                shape: const CircleBorder(), padding: const EdgeInsets.all(15)),
            child: Text(value.weekDays[index]),
            onPressed: () {
              print(value.weekDays[index]);
            },
          ),
        ),
      ),
    );
  }
}
