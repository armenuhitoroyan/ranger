import 'dart:async';

import 'package:flutter/material.dart';

import '../../config/colors.dart';

class SliderState extends StatefulWidget {
  int? changePercent;

  SliderState({
    this.onChanged,
  });

  // final ValueChanged<int> onChanged;
  Function(int)? onChanged;

  @override
  State<SliderState> createState() => _SliderStateState();
}

class _SliderStateState extends State<SliderState> {
  double width = 0;
  bool isTurned = false;
  bool isTurnOn = false;
  double percent = 0;
  int value = 0;

  @override
  void initState() {
    widget.onChanged;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _contentBuilder();
  }

  Widget _contentBuilder() {
    double contWidth = MediaQuery.of(context).size.width;
    return Stack(children: <Widget>[
      Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
        child: SizedBox(
          width: width > 0 ? width : 0,
          height: 70,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                gradient: LinearGradient(colors: [
                  RangerColors.white,
                  isTurned ? RangerColors.yellowBtn : RangerColors.greyBottomBar
                ])),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 20, left: 15, right: 15),
        child: GestureDetector(
          // onTap: () => widget.onChanged!(percent.round()),
          onDoubleTap:  _test(),
          onHorizontalDragStart: (details) => 0,
          onHorizontalDragUpdate: (details) => isTurnOn
              ? _onDecideIllumination(contWidth, details.globalPosition.dx)
              : null,
          child: Container(
            width: double.infinity,
            height: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(
                  width: 2.5,
                  color: isTurned
                      ? RangerColors.yellowBtn
                      : RangerColors.greyBottomBar),
            ),
            child: Row(
              children: [
                Flexible(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: _onTurnLight,
                        icon: isTurned
                            ? const Icon(
                                Icons.lightbulb_sharp,
                                color: RangerColors.yellowBtn,
                              )
                            : const Icon(Icons.lightbulb_outline),
                      ),
                      const Text('DP motik')
                    ],
                  ),
                ),
                Row(
                  children: [
                    isTurned || isTurnOn
                        ? Text('${percent.round()}')
                        : const Text('On'),
                    const Icon(Icons.import_export)
                  ],
                )
              ],
            ),
          ),
        ),
      )
    ]);
  }

  bool _onTurnLight() {
    setState(() {
      isTurned = !isTurned;
      isTurnOn = true;
    });

    return isTurned;
  }

  _onDecideIllumination(double contWidth, double? slideErWidth) {
    setState(() {
      if (slideErWidth! > 0) {
        contWidth = contWidth - 30;
        width = (slideErWidth);
        percent = ((100 * slideErWidth) / contWidth - 1).clamp(0, 100);
      } else if (slideErWidth < 0) {
        width = 0;
        percent = 0;
      }
    });

    return percent;
  }

  _test() {
    String singleWhere(Iterable<String> items) {
      return items.singleWhere((element) => true);
    }
  }
}
