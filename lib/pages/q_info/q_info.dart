import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ranger/base/routes.dart';
import 'package:ranger/config/app_style.dart';
import 'package:ranger/config/colors.dart';
import 'package:ranger/config/images.dart';
import 'package:ranger/pages/q_info/bloc/q_info_bloc.dart';

import '../../config/str.dart';

class Information extends StatelessWidget with RangerImages {
  AppStyle appStyle = AppStyle();
  Information({super.key});

  TextEditingController addressController = TextEditingController();
  TextEditingController pinCodeController = TextEditingController();

  String addressErrorMsg = '';
  String pincodeErrorMsg = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: RangerColors.white,
      appBar: AppBar(
        title: const Center(
            child: Text(
          RangerTexts.titleInfoPage,
          style: TextStyle(
            color: RangerColors.black,
          ),
        )),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: BlocBuilder<QrInfoBloc, QInfoValidState>(
            builder: (context, state) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Image.asset('images/${super.q_back_label}'),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                        child: TextField(
                          controller: addressController,
                          onChanged: (value) {
                            BlocProvider.of<QrInfoBloc>(context).add(
                                QInfoTextChangedEvent(addressController.text,
                                    pinCodeController.text));

                            addressErrorMsg = state.errorAddress!;
                          },
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                width: 1,
                                color: RangerColors.greyBottomBar,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            labelText: RangerTexts.macAddress,
                            border: const OutlineInputBorder(),
                            helperText: RangerTexts.helperTextAddress,
                            errorText: !state.isValid && !state.isValidAddress
                                ? state.errorMessage
                                : state.isValidAddress
                                    ? state.errorAddress
                                    : '',
                            focusedErrorBorder: const UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: RangerColors.blueBtn),
                            ),
                            errorStyle: TextStyle(
                              color: !state.isValid && !state.isValidPinCode
                                  ? RangerColors.errorColor
                                  : state.isValidPinCode
                                      ? RangerColors.errorColor
                                      : RangerColors.blueBtn,
                            ),
                            suffixIcon: InkWell(
                              onTap: () => addressController.clear(),
                              child: Icon(
                                Icons.cancel_outlined,
                                color: state.isValid
                                    ? RangerColors.blueBtn
                                    : RangerColors.greyBottomBar,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                        child: TextField(
                          // obscureText: true,
                          controller: pinCodeController,
                          onChanged: (value) {
                            BlocProvider.of<QrInfoBloc>(context).add(
                                QInfoTextChangedEvent(addressController.text,
                                    pinCodeController.text));

                            pincodeErrorMsg = state.errorPin!;
                          },
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                width: 1,
                                color: RangerColors.greyBottomBar,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            border: const OutlineInputBorder(),
                            labelText: RangerTexts.pin,
                            suffixIcon: InkWell(
                              onTap: () => pinCodeController.clear(),
                              child: Icon(
                                Icons.cancel_outlined,
                                color: state.isValid
                                    ? RangerColors.blueBtn
                                    : RangerColors.greyBottomBar,
                              ),
                            ),
                            helperText: RangerTexts.helperTextPin,
                            errorText: !state.isValid && !state.isValidPinCode
                                ? state.errorMessage
                                : state.isValidPinCode
                                    ? state.errorPin
                                    : '',
                            errorStyle: TextStyle(
                              color: !state.isValid && !state.isValidPinCode
                                  ? RangerColors.errorColor
                                  : state.isValidPinCode
                                      ? RangerColors.errorColor
                                      : RangerColors.blueBtn,
                            ),
                            focusedErrorBorder: const UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: RangerColors.blueBtn),
                            ),
                            // focusColor: RangerColors.black
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 70,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: ElevatedButton(
                        onPressed: () {
                          BlocProvider.of<QrInfoBloc>(context).add(
                              QInfoTextChangedEvent(addressController.text,
                                  pinCodeController.text));
                          state.isValid == true
                              ? Navigator.pushNamed(context, AppRoutes.navbar)
                              : null;
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: state.isValid
                                ? RangerColors.blueBtn
                                : RangerColors.greyBottomBar),
                        child: const Text(
                          RangerTexts.submit,
                          style: TextStyle(color: RangerColors.white),
                        ),
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                          RangerTexts.gettingSetUp),
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
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
