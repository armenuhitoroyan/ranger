import 'package:flutter/material.dart';

class AutomationProvider extends ChangeNotifier {
  bool isShow = false;
  String alertDialog = 'temerDialog';

  bool onShowButtons() {
    isShow = !isShow;

    print(isShow);
    notifyListeners();
    return isShow;
  }
}
