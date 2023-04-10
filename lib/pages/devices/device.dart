import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ranger/config/str.dart';
import 'package:ranger/pages/devices/bloc/device_bloc.dart';

import '../../config/colors.dart';

class Device extends StatelessWidget {
  var items = [
    'See 1 More',
    'See 2 More',
    'See 3 More',
    'See 4 More',
    'See 5 More',
  ];

  bool isChanged = false;
  double direction = 0.0;

  bool isStarted = true;
  double width = 0;

  @override
  Widget build(BuildContext context) {
    double contWidth = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return BlocBuilder<DeviceBloc, DeviceState>(
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    children: <Widget>[
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: RangerColors.blueBtn,
                          border: Border.all(color: RangerColors.blueBtn),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 15),
                              child: Text(
                                RangerTexts.grove,
                                style: TextStyle(
                                    fontSize: 30, color: Colors.white),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 25),
                              child: Text(
                                RangerTexts.lightsOn,
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 25),
                              child: Text(
                                RangerTexts.running,
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 25),
                              child: Text(
                                RangerTexts.outlet,
                                style: TextStyle(
                                    fontSize: 18, color: RangerColors.white),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(bottom: 15, left: 25),
                              child: DropdownButton(
                                dropdownColor: RangerColors.blueBtn,
                                value: state.dropdownvalue,
                                icon: const Icon(
                                  Icons.keyboard_arrow_right,
                                  color: RangerColors.white,
                                ),
                                items: items.map((String item) {
                                  return DropdownMenuItem(
                                    value: item,
                                    child: Text(
                                      item,
                                      style: const TextStyle(
                                          color: RangerColors.white),
                                    ),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  BlocProvider.of<DeviceBloc>(context)
                                      .add(SelectDropdownItemEvent(value!));
                                  state.dropdownvalue = value;
                                },
                              ),
                            ),
                            const SizedBox(
                              height: 40,
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 150.0),
                        child: Container(
                          width: double.infinity,
                          height: height,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: RangerColors.white,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Flexible(
                                      flex: 1,
                                      child: Row(
                                        children: const [
                                          Text(RangerTexts.favorite),
                                        ],
                                      ),
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: const [
                                        Icon(
                                          Icons.edit_rounded,
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Stack(children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 15, right: 15),
                                  child: SizedBox(
                                    width: width > 0 ? width : 0,
                                    height: 70,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        gradient: LinearGradient(colors: [
                                          RangerColors.white,
                                          state.onOff
                                              ? Colors.yellow
                                              : RangerColors.greyBottomBar
                                        ], tileMode: TileMode.decal),
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.topCenter,
                                  child: SizedBox(
                                    width: double.infinity,
                                    height: 70,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 15.0, right: 15.0),
                                      child: GestureDetector(
                                        onHorizontalDragStart:
                                            (DragStartDetails details) => 0,
                                        onHorizontalDragUpdate: (details) {
                                          BlocProvider.of<DeviceBloc>(context)
                                              .add(UpdateTheWidth(
                                                  details.globalPosition.dx,
                                                  contWidth));

                                          direction = details.globalPosition.dx;

                                          state.index = direction;
                                          state.isStarted = isStarted;
                                          width = direction.roundToDouble();
                                          print(state.index);
                                        },
                                        onHorizontalDragEnd: (details) {
                                          // if (state.percent == 100) {
                                          //   return;
                                          // }
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border: Border.all(
                                                color: state.onOff
                                                    ? Colors.amber
                                                    : RangerColors
                                                        .greyBottomBar,
                                                width: 2),
                                          ),
                                          child: Row(
                                            children: [
                                              Flexible(
                                                  flex: 1,
                                                  child: Row(
                                                    children: [
                                                      InkWell(
                                                        onTap: () {
                                                          BlocProvider.of<
                                                                      DeviceBloc>(
                                                                  context)
                                                              .add(ChangeColor(
                                                                  isChanged));
                                                          BlocProvider.of<
                                                                      DeviceBloc>(
                                                                  context)
                                                              .add(
                                                                  ChangeSlideColor());
                                                        },
                                                        child: state.onOff
                                                            ? const Icon(
                                                                Icons
                                                                    .lightbulb_sharp,
                                                                color: Colors
                                                                    .amber,
                                                              )
                                                            : const Icon(Icons
                                                                .lightbulb_outline),
                                                      ),
                                                      const Text('DP motik')
                                                    ],
                                                  )),
                                              Row(
                                                children: [
                                                  state.onOff || state.index > 0
                                                      ? Text(
                                                          '${(state.percent).round()}%')
                                                      : state.isStarted
                                                          ? const Text('0%')
                                                          : const Text('On'),
                                                  const Icon(
                                                      Icons.import_export)
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ]),
                              const Padding(
                                padding: EdgeInsets.only(
                                    left: 20, right: 20, top: 100),
                                child: Text(
                                  RangerTexts.favDevs,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 40),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 20, right: 20, top: 70, bottom: 70),
                                child: Container(
                                  width: max(200, 70),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white,
                                      border: Border.all(
                                          color: RangerColors.blueBtn)),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 10, bottom: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: const [
                                        Icon(
                                          Icons.add,
                                          color: RangerColors.blueBtn,
                                        ),
                                        Text(
                                          RangerTexts.addFav,
                                          style: TextStyle(
                                              color: RangerColors.blueBtn),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
