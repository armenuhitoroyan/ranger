import 'package:flutter/material.dart';

class TimeProvider extends ChangeNotifier {
  int val = 1;
  int i = 0;
  int index = 0;
  bool isPressed = false;
  String message = 'error';
  String color = 'black';
  bool isVisible = false;
  String alertDialog = '';
  bool ab = false;
  bool ampm = false;
  ScrollController scrollController = ScrollController(keepScrollOffset: true);
  double h = 0.0;
  bool isSelected = false;
  double height = 0.0;

  List<String> list = [
    'Auto-off after...',
    'Auto-on after...',
    'Daytime auto-off '
  ];

  List<String> listDAtes = ['Sunrise', 'Sunset', 'Time'];

  List<IconData> listIcons = [
    Icons.sunny,
    Icons.sunny_snowing,
    Icons.timelapse_rounded
  ];

  List<String> afterBefore = [
    'After',
    'Before',
  ];

  List<String> amPm = [
    'AM',
    'PM',
  ];

  List<String> weekDays = ['S', 'M', 'T', 'W', 'T', 'F', 'S'];

  TimeProvider() {
    // setIndex();
    getData();
  }

  setIndex() async {
    if (i == 2) {
      ampm = true;
      ab = false;
      return ampm;
      notifyListeners();
    } else {
      ampm = false;
      ab = true;
      return ab;
      notifyListeners();
    }
    notifyListeners();
    return i;
  }

  int setState(value) {
    val = value;
    notifyListeners();
    return val;
  }

  int getValue(int val) {
    i = val;
    notifyListeners();
    return i;
  }

  List<String> getData() {
    notifyListeners();
    return list;
  }

  void onpressed() {
    if (message == 'error' && isPressed == false) {
      message = 'success';
      color = 'blue';
      isPressed = !isPressed;
      notifyListeners();
    } else if (message == 'success' && isPressed == false) {
      color = 'blue';
      message = 'success';
      isPressed = !isPressed;
      notifyListeners();
    } else if (message == 'success' && isPressed == true) {
      color = 'black';
      message = 'error';
      isPressed = !isPressed;
      notifyListeners();
    }

    isPressed = !isPressed;
    notifyListeners();
  }

  onCheckNotification(notification) {
    if (notification is ScrollEndNotification) {
      if (notification.metrics.pixels == scrollController.position.pixels) {
        h = notification.metrics.pixels;
        isSelected = true;
        notifyListeners();
        return isSelected;
      } else {
        isSelected = false;
        notifyListeners();
      }
    } else {
      isSelected = false;
      h = 0.0;
      notifyListeners();
    }

    return isSelected;
  }

  bool onVisibleTime() {
    isVisible = false;
    notifyListeners();
    return isVisible;
  }


 
}
