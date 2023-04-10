import 'package:flutter/material.dart';

import '../../../../config/colors.dart';
import '../../../../config/maps/map_time.dart';
import '../../../../config/pixels.dart';

class AfterBefore extends StatefulWidget {
  @override
  State<AfterBefore> createState() => _AfterBeforeState();
}

class _AfterBeforeState extends State<AfterBefore> {
  ScrollController _scrollController = ScrollController();
  List<String> afterBefore = [
    'After',
    'Before',
  ];

   List<String> ampm = [
    'AM',
    'PM',
  ];

  double _height = 0.0;
  double height = 0.0;
  double h = 0.0;

  int i = 0;

  bool isSelected = false;

  @override
  void initState() {
    setState(() {
      super.initState();
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener(
      child: ListView.builder(
          itemCount: 5,
          controller: _scrollController,
          itemBuilder: (context, index) {
            height = _scrollController.position.pixels; // --------
            return InkWell(
              onTap: () {
                // print('index = $index');
                print('get index == ${getIndex(index)}');
                height = _scrollController.position.pixels; // --------
                print(height);
                // print(_scrollController.position.pixels);
              },
              child: SizedBox(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: index == getIndex(index+1)
                        ? RangerColors.rowsBlue
                        : RangerColors.white,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 5.0),
                    child: index == 0 || index == 3 || index == 4
                        ? const Text(
                            '',
                            style: TextStyle(color: Colors.white),
                          )
                        : Text(
                          MapTime.apm == false ? afterBefore[index - 1] : ampm[index-1],
                            style: TextStyle(
                                color: index == getIndex(index+1)
                                    ? Colors.white
                                    : Colors.black),
                          ),
                  ),
                ),
              ),
            );
          }),
      onNotification: (notification) {
        if (notification is ScrollEndNotification) {
          h = notification.metrics.pixels;
          Pixels.pixel = h;
          // print(h);

          setState(() {
            _height = getPixels(h);
          });

          isSelected = true;
          return isSelected;
        } else {
          isSelected = false;
          h = 0.0;
        }

        return isSelected;
      },
    );
  }

  getPixels(double pixels) {
    _height = pixels;
    return _height;
  }

  getIndex(int index) {
    if (index == 1) {
      i = ((height/15.0).round())+1;
    }
    if (index == 2) {
      i = ((height/15.0).round())+1;
    }
    return i;
  }
}
