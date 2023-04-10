import 'package:flutter/material.dart';

import '../../../../config/colors.dart';
import '../../../../config/maps/map_time.dart';
import '../../../../config/pixels.dart';

class Hours extends StatefulWidget {
  @override
  State<Hours> createState() => _HoursState();
}

class _HoursState extends State<Hours> {
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
          itemCount: 13,
          controller: _scrollController,
          itemBuilder: (context, index) {
            height = _scrollController.position.pixels; // --------
            return InkWell(
              onTap: () {},
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
                    child: index == 12
                        ? const Text(
                            '',
                            style: TextStyle(color: Colors.white),
                          )
                        : Text(
                             MapTime.hour == false 
                              ? '$index h' 
                              : 
                                index >= 0 &&  index < 10 ? '0$index' :'$index',
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
    } 

    if (index > 5) {
      i = (height / 15.5).round()+1;
    }
   
    MapTime.map['hours'] = '$i';
    return i;
  }
}
