import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ranger/base/routes.dart';
import 'package:ranger/config/app_style.dart';
import 'package:ranger/pages/automations/automation.dart';

import 'package:ranger/pages/automations/pickers/date.dart';
import 'package:ranger/pages/automations/pickers/time.dart';
import 'package:ranger/pages/automations/pickers/widgets/timer.dart';
import 'package:ranger/pages/automations/searching/search_words.dart';
import 'package:ranger/pages/devices/bloc/device_bloc.dart';

import 'package:ranger/pages/devices/device.dart';
import 'package:ranger/pages/devices/devices.dart';
import 'package:ranger/pages/homepage.dart';
import 'package:ranger/pages/settings/settings.dart';
import 'package:ranger/widgets/bottom_nav_bar/bottom_navbar.dart';

import 'pages/homepage/homepage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
    apiKey: 'AIzaSyA96xW57JvWcjcb4Q33WwfQ29d1hxIL7Wc',
    appId: '1:23073069969:android:51fbdd9be2efb74eced830',
    messagingSenderId: '23073069969',
    projectId: 'search-37ee0',
    storageBucket: 'search-37ee0.appspot.com',
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:
          //  Settings(),
          // DevicesState(),
          // BlocProvider(
          //   create: (context) => DeviceBloc(),
          //   child: Device(),
          // ),
  

          // TimePicker(),
          // AutomationPage(),
          // SearchWords(),
          // DatePicker(),

          const HomePage(title:'Homepage',),
          // CustomPicker(),

          
          // ExPage(),
          // BottomNavbar(),
      // HomePageState(title: 'Flutter Demo Home Page',),
      onGenerateRoute: AppRoutes.onGenerateRoute,
    );
  }
}
