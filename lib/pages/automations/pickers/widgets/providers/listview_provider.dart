import 'package:flutter/material.dart';

class ListProvider extends ChangeNotifier {
  bool isHover = false;
  int index = 0;
  int ind = 0;
  int i = 0;
  double height = 0.0;
  double pos = 0.0;
  double position = 0.0;

  bool isSelected = false;
  // ScrollController scrollController = ScrollController();
  ScrollController scrollController = ScrollController(keepScrollOffset: true);
  List<String> items = [];
  double h = 0.0;

  ListProvider() {
    getIndex();
    onSelected();
    // onChangeHeight();
  }

  int onHover(int val) {
    index = val;
    notifyListeners();
    return index;
  }

  bool onHoverText(bool hover) {
    if (hover) {
      isHover = hover;
    } else {
      isHover = false;
    }
    notifyListeners();
    return isHover;
  }

  int getValue(int val) {
    i = val;
    notifyListeners();
    return i;
  }

  double getPosition(double pos) {
    position = pos;
    notifyListeners();
    return position;
  }

  int getIndex() {
    i = i;
    notifyListeners();
    return i;
  }

  // onChangeHeight() {
  //   height = scrollController.position.pixels;
  //   notifyListeners();
  //   return height;
  // }

  animateToIndex(int index) {
    // this.index = index;
    height = scrollController.position.pixels;
    if (index > 0 && index <= 5) {
      ind = ((height / (2 * index)).round()) - 1;
      print('ind = $ind');
      print(height);
      notifyListeners();
    }
    //  else if (index > 6 && index <= 7) {
    //   ind = ((height / (4 * index)).round());
    //   print('ind = $ind');
    //   notifyListeners();
    // } else if (index > 7 && index < 10) {
    //   ind = ((height / (4 * index)).round() + 2);
    //   print('ind = $ind');
    //   notifyListeners();
    // }

    print('i => $ind');
    notifyListeners();
    return ind;
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

  bool onSelected() {
    isSelected = true;
    notifyListeners();
    return isSelected;
  }
}
