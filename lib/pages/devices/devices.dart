import 'package:flutter/material.dart';
import 'package:ranger/config/colors.dart';
import 'package:ranger/config/str.dart';
import 'package:ranger/pages/devices/widgets/appbar_textts.dart';
import 'package:ranger/pages/slider/slider.dart';

class DevicesState extends StatefulWidget {
  @override
  State<DevicesState> createState() => _DevicesStateState();
}

class _DevicesStateState extends State<DevicesState> {
  List<String> list = <String>[
    'See More 1',
    'See More 2',
    'See More 3',
    'See More 4',
    'See More 5'
  ];

  String dropdownValue = 'See More 1';
  int? value;

  SliderState sliderState = SliderState();

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _contentBuilder();
  }

  Widget _contentBuilder() {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: RangerColors.blueBtn,
                      border: Border.all(color: RangerColors.blueBtn)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child: AppbarTexts(RangerTexts.grove, 30),
                      ),
                      AppbarTexts(RangerTexts.lightsOn, 18),
                      AppbarTexts(RangerTexts.running, 18),
                      AppbarTexts(RangerTexts.outlet, 18),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: DropdownButton<String>(
                          dropdownColor: RangerColors.blueBtn,
                          icon: const Icon(
                            Icons.keyboard_arrow_right,
                            color: RangerColors.white,
                          ),
                          value: dropdownValue,
                          elevation: 16,
                          style: const TextStyle(color: RangerColors.white),
                          onChanged: _onSelectItem,
                          items: list
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 220.0),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      width: double.infinity,
                      height: height,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: RangerColors.white),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 15.0, right: 15.0, top: 15.0),
                            child: Row(
                              children: [
                                Flexible(
                                  flex: 1,
                                  child: Row(
                                    children: const [
                                      Text(RangerTexts.favorite)
                                    ],
                                  ),
                                ),
                                Row(
                                  children: const [Icon(Icons.edit_rounded)],
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 15.0, top: 20.0),
                            child: Row(
                              children: const [
                                Text(
                                  'All Devices',
                                  style: TextStyle(
                                      fontSize: 25, color: RangerColors.black),
                                  textAlign: TextAlign.start,
                                ),
                              ],
                            ),
                          ),
                          SliderState(
                            onChanged: (int val) {
                              setState(
                                () {
                                  value = val;
                                  print(value);
                                },
                              );
                            },
                          ),
                          // Slider(),
                          const Padding(
                            padding:
                                EdgeInsets.only(left: 20, right: 20, top: 100),
                            child: Text(
                              RangerTexts.favDevs,
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 30.0),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 70),
                            child: Container(
                              width: 200,
                              height: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: RangerColors.white,
                                  border:
                                      Border.all(color: RangerColors.blueBtn)),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  IconButton(
                                    onPressed: onCountLetters('ddvvfrgbv'),
                                    icon: const Icon(
                                      Icons.add,
                                      color: RangerColors.blueBtn,
                                    ),
                                  ),
                                  const Text(
                                    RangerTexts.addFav,
                                    style:
                                        TextStyle(color: RangerColors.blueBtn),
                                  )
                                ],
                              ),
                            ),
                          ),
                          // Text(
                          //   value != null ? '$value' : '0',
                          //   style: const TextStyle(
                          //       color: Colors.amber, fontSize: 30),
                          // )
                        ],
                      ),
                    ),
                  ),
                )
              ]),
            ],
          ),
        ),
      ),
    );
  }

  void _onSelectItem(String? value) {
    setState(() {
      dropdownValue = value!;
    });
  }

  onCountLetters(String word) {

    Map<String, int> countLetters(final String word) {
      final Map<String, int> countValues = {};

      word.split(" ").join().split("").forEach((final letter) {
        if (countValues[letter] != null) {
          countValues[letter] = countValues[letter]! + 1;
        } else {
          countValues[letter] = 1;
        }
      });

      return countValues;
    }
  }
}
