import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ranger/base/routes.dart';
import 'package:ranger/config/colors.dart';
import 'package:ranger/config/images.dart';
import 'package:ranger/config/str.dart';

import 'bloc/scanner_bloc.dart';

class HomePageState extends StatelessWidget with RangerImages {
  HomePageState({
    super.key,
    required this.title,
  });

  final String title;
  String data = '';
  Function? scan;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ScannerBloc>(
      create: (context) => ScannerBloc(),
      child: Scaffold(
        backgroundColor: RangerColors.white,
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
              child: SafeArea(
                child: BlocBuilder<ScannerBloc, ScannerState>(
                  builder: (context, state) {

                    
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Text(
                          RangerTexts.letsConnect,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.headline4,
                        ),
                        Image.asset('assets/${super.q_back_label}'),
                        SizedBox(
                          height: 20,
                          child: Text(
                            state.data,
                            style: const TextStyle(color: RangerColors.blueBtn),
                          ),
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15, right: 15),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: RangerColors.blueBtn),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      BlocProvider.of<ScannerBloc>(context)
                                          .add(ScanEvent());
                                    },
                                    icon: const Icon(
                                      Icons.photo_camera_rounded,
                                      color: RangerColors.white,
                                    ),
                                  ),
                                  ElevatedButton(
                                    onPressed: () => showDialog<String>(
                                      context: context,
                                      builder: (BuildContext context) =>
                                          AlertDialog(
                                        title: const Text(
                                            RangerTexts.accessCamera),
                                        content: const Text(
                                            RangerTexts.dialogDescription),
                                        actions: <Widget>[
                                          TextButton(
                                            onPressed: () => Navigator.pop(
                                                context, RangerTexts.cansel),
                                            child:
                                                const Text(RangerTexts.cansel),
                                          ),
                                          TextButton(
                                            onPressed: () => Navigator.pop(
                                                context, RangerTexts.ok),
                                            child: const Text(RangerTexts.ok),
                                          ),
                                        ],
                                      ),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            RangerColors.yellowBtn),
                                    child: const Text(
                                      RangerTexts.scan,
                                      style:
                                          TextStyle(color: RangerColors.black),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                          child: Text(RangerTexts.or),
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 15, right: 15),
                              child: InkWell(
                                onTap: () {
                                  Navigator.pushNamed(context, AppRoutes.info);
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: RangerColors.white,
                                      border: Border.all(
                                          color: RangerColors.blueBtn)),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 10, bottom: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: const [
                                        Text(
                                          RangerTexts.enterManually,
                                          style: TextStyle(
                                              color: RangerColors.blueBtn),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              )),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Text(RangerTexts.gettingSetUp),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text(RangerTexts.contact),
                                Text(
                                  RangerTexts.emailAdd,
                                  style: TextStyle(color: RangerColors.blueBtn),
                                ),
                              ],
                            )
                          ],
                        )
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
