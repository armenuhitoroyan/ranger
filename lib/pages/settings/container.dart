import 'package:flutter/material.dart';
import 'package:ranger/pages/settings/settings.dart';

import '../../config/colors.dart';

class ContainerState extends StatelessWidget {
  Color bgColor;
  late int itemCount;

  ContainerState({
    super.key,
    required this.bgColor,
  });

  @override
  Widget build(BuildContext context) {
    return _buildContent(context);
  }

  Widget _buildContent(BuildContext context) {
    
    double maxWidth = MediaQuery.of(context).size.width;
    double width = maxWidth - 30;
    return Container(
      width: width / Settings.count,
      height: 150,
      decoration: BoxDecoration(
        border: Border.all(color: RangerColors.blueBtn),
        color: bgColor,
      ),
    );
  }
}
