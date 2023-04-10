import 'package:flutter/material.dart';
import 'package:ranger/config/colors.dart';

class AppbarTexts extends StatelessWidget {
  String data;
  double fontSize;

  AppbarTexts(this.data, this.fontSize);

  @override
  Widget build(BuildContext context) {
    return appbarText(data, fontSize);
  }

  Widget appbarText(String data, double fontSize) {
    return Padding(
      padding: const EdgeInsets.only(left: 15),
      child: Text(
        data,
        style: TextStyle(color: RangerColors.white, fontSize: fontSize),
      ),
    );
  }
}
