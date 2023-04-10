import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ranger/config/colors.dart';
import 'package:ranger/config/images.dart';
import 'package:ranger/config/str.dart';
import 'package:ranger/pages/automations/searching/bloc/gsearch_bloc.dart';

import '../../../base/routes.dart';

class SearchWords extends StatelessWidget {
  TextEditingController searchController = TextEditingController();
  bool isLoaded = false;
  bool isSubmitted = false;
  String data = '';

  @override
  Widget build(BuildContext context) {
    return _buildContent();
  }

  Widget _buildContent() {
    return BlocProvider(
      create: (context) => GsearchBloc(),
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: BlocBuilder<GsearchBloc, GsearchState>(
              builder: (context, state) {
                return Column(
                  children: [
                    Stack(children: <Widget>[
                      Container(
                        width: double.infinity,
                        decoration:
                            const BoxDecoration(color: RangerColors.blueBtn),
                        child: const Padding(
                          padding: EdgeInsets.only(
                              left: 10.0, right: 10.0, top: 40.0, bottom: 40.0),
                          child: Text(
                            RangerTexts.automations,
                            style: TextStyle(
                                fontSize: 30, color: RangerColors.white),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 100, left: 30, right: 30),
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: TextField(
                            controller: searchController,
                            onChanged: (value) {
                              BlocProvider.of<GsearchBloc>(context)
                                  .add(GsearchedEvent(searchController.text));
                            },
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: RangerColors.white,
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  width: 1,
                                  color: RangerColors.greyBottomBar,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              prefixIcon: const Icon(Icons.search),
                              // icon: const Icon(Icons.search),
                              hintText: 'Search by name, ...',
                              border: const OutlineInputBorder(),
                              suffixIcon: const Icon(Icons.arrow_right_sharp),
                            ),
                          ),
                        ),
                      ),
                    ]),
                    Container(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 120,
                            child: Center(
                                child: state.isLoaded
                                    ? Text(state.searchValue)
                                    : const CircularProgressIndicator(
                                        color: RangerColors.blueBtn,
                                      )),
                          ),

                          //  Spacer(flex: 2,),
                          const Text(
                            'No Automation added yet',
                            style: TextStyle(
                              fontSize: 40,
                              color: RangerColors.black,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          const Text(
                            'Tap the + to create one now',
                            style: TextStyle(
                                fontSize: 30, color: RangerColors.black),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          SizedBox(
                            height: 100,
                            child: RangerImages.circularLineArrow,
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            // crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    right: 20.0, bottom: 20.0),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      shape: const CircleBorder(),
                                      padding: const EdgeInsets.all(20)),
                                  child: const Icon(
                                    Icons.add,
                                    size: 20,
                                  ),
                                  onPressed: () {
                                    Navigator.pushNamed(
                                        context, AppRoutes.automation);
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                );
              },
            ),
          ),
        ),
        // bottomNavigationBar: BottomNavbar(),
      ),
    );
  }
}
