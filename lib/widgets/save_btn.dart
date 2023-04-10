import 'package:flutter/material.dart';

import '../config/colors.dart';
import '../config/str.dart';

class Save extends StatefulWidget {
  Function callback;

  Save({super.key, required this.callback});

  @override
  State<Save> createState() => _SaveState();
}

class _SaveState extends State<Save> {
  double sideLength = 50;
  @override
  void initState() {
    super.initState();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return _buildContent();
  }

  Widget _buildContent() {
    return Material(
      child: InkWell(
        onTap: () {},
        onHover: (value) {
          setState(() {
            sideLength = value ? 150 : 50;
            print("Save *******");
          });
        },
        child: AnimatedContainer(
          width: double.infinity,
          height: sideLength,
          duration: Duration(seconds: 2),
          curve: Curves.easeIn,
          child: Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 15.0),
            child: ElevatedButton(
              onPressed: () => widget.callback(),
              style: ElevatedButton.styleFrom(
                  backgroundColor: RangerColors.blueBtn),
              child: const Text(RangerTexts.save),
            ),
          ),
        ),
      ),
    );
  }
}
