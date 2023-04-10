import 'package:flutter/material.dart';
import 'package:ranger/config/colors.dart';

import '../../widgets/bottom_nav_bar/bottom_navbar.dart';
import 'container.dart';

class Settings extends StatelessWidget {
  static int count = 0;
  Color bgC3 = const Color(0xff151b3c);
  Color bgC2 = const Color(0xff2a3679);
  Color bgC1 = const Color(0xff344397);
  Color bgC0 = const Color(0xff344397);

  List<Color> colors = [];
  Settings({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return _buildContent(const Color.fromARGB(255, 63, 81, 181), 7);
  }

  Widget _buildContent(Color? bgColor, int itemCount) {
    count = itemCount;
    gradient(bgColor!, itemCount);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SafeArea(
            child: Wrap(
                children: List.generate(
                    itemCount,
                    (index) => ContainerState(
                          bgColor: index == 0 ? Colors.black : colors[index],
                        )))),
      ),
    );
  }

  gradient(
    Color bgColor,
    int itemCount,
  ) {
    int r = bgColor.red;
    int g = bgColor.green;
    int b = bgColor.blue;
    int a = bgColor.alpha, cR, cG, cB;
    int index = itemCount;
    cR = (r / itemCount).round();
    cG = (g / itemCount).round();
    cB = (b / itemCount).round();

    while (index > 0) {
      r = (cR / (index)).round();
      g = (cG / (index)).round();
      b = (cB / (index)).round();
      cR = r + cR;
      cG = g + cG;
      cB = b + cB;

      bgColor = Color.fromARGB(
        a,
        cR,
        cG,
        cB,
      );
      print(bgColor);
      colors.add(bgColor);

      index--;
    }
  }


}
