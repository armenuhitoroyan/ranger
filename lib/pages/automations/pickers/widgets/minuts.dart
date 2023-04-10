import 'package:flutter/material.dart';

import '../../../../config/colors.dart';
import '../../../../config/maps/map_time.dart';
import '../../../../config/pixels.dart';

class Minutes extends StatefulWidget {
  @override
  State<Minutes> createState() => _MinutesState();
}

class _MinutesState extends State<Minutes> {
  ScrollController _scrollController = ScrollController();

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
          itemCount: 61,
          controller: _scrollController,
          itemBuilder: (context, index) {
            height = _scrollController.position.pixels; // --------
            return InkWell(
              onTap: () {
                // print('index = $index');
                // print('get index == ${getIndex(index)}');

                // print(height);
                // print(_scrollController.position.pixels);
              },
              child: SizedBox(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: index == 0 || (index == getIndex(index + 1))
                        ? RangerColors.rowsBlue
                        : RangerColors.white,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 5.0),
                    child: index == 60
                        ? const Text(
                            '',
                            style: TextStyle(color: Colors.white),
                          )
                        : Text(
                            MapTime.hour == false
                                ? '$index min'
                                : index >= 0 && index < 10
                                    ? '0$index'
                                    : '$index',
                            style: TextStyle(
                                color:
                                    index == 0 || (index == getIndex(index + 1))
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
    if (index <= 5) {
      i = ((height / (2 * index)).round()) - 1;
    } else if (index > 6 && index < 8) {
      i = ((height / (2 * index)).round());
    } else if (index > 8 && index < 10) {
      i = ((height / (2 * index)).round() + 2);
    }

    if (index > 13 && index < 15) {
      i = (height / 15.5).round() + 1;
    }
    if (index > 15 && index < 17) {
      i = ((height / (index)).round() + 1);
    }

    if (index > 30 && index < 45) {
      i = (height / 15.5).round();
      // print(i);
    }

    if (index > 46 && index <= 50) {
      i = (height / 15.5).round();
    }

    if (index > 50 && index < 60) {
      i = ((height / 15.5).round() - 1);
      // print(i);
    }

    // print('i => $i');

    MapTime.map['miutes'] = '$i';
    return i;
  }
}
