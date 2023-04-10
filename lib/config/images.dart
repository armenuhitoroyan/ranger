import 'package:flutter/material.dart';

class RangerImages {
  final String _qBackLabel = 'qbacklabel.png';

  // static const String circularLineArrow = 'circular_line_arrow.png';

  String get q_back_label {
    return _qBackLabel;
  }

   static Image circularLineArrow = Image.asset(
    'images/circular_line_arrow.png',
  );
}
