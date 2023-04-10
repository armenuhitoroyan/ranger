import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ranger/pages/automations/automation.dart';
import 'package:ranger/pages/automations/pickers/date.dart';
import 'package:ranger/pages/automations/pickers/time.dart';

import 'package:ranger/pages/homepage.dart';
import 'package:ranger/pages/q_info/q_info.dart';
import 'package:ranger/pages/rooms/rooms.dart';
import 'package:ranger/pages/settings/settings.dart';
import 'package:ranger/widgets/bottom_nav_bar/bottom_navbar.dart';

import '../pages/automations/searching/search_words.dart';
import '../pages/devices/bloc/device_bloc.dart';

import '../pages/devices/devices.dart';
import '../pages/devices/device.dart';
import '../pages/q_info/bloc/q_info_bloc.dart';

class AppRoutes {
  static const homepage = '/';
  static const info = '/info';
  static const mobScan = '/scan';
  static const brScan = '/scanner';
  static const device = '/device';
  static const rooms = '/rooms';
  static const automations = '/automations';
  static const automation = '/new_automation';
  static const settings = '/setting';
  static const devices = '/devices';
  static const timePicker = '/time_picker';
  static const datePicker = '/date_picker';
  static const navbar = '/navbar';

  // static List<GetPage> routes = [
  //   GetPage(name: device, page: () => DevicesState()),
  //   GetPage(name: rooms, page: () => Rooms()),
  //   GetPage(name: automations, page: () => SearchWords()),
  //   GetPage(name: settings, page: () => Settings()),
  // ];

  static MaterialPageRoute onGenerateRoute(RouteSettings settings) {
    if (settings.arguments != null) {}

    var routes = <String, WidgetBuilder>{
      AppRoutes.homepage: (context) => const HomePage(
            title: '',
          ),
      AppRoutes.info: (context) => BlocProvider(
            create: (context) => QrInfoBloc(),
            child: Information(),
          ),
      AppRoutes.device: (context) => BlocProvider(
            create: (context) => DeviceBloc(),
            child: Device(),
          ),
      AppRoutes.rooms: (context) => Rooms(),
      AppRoutes.automations: (context) => SearchWords(),
      AppRoutes.automation: (context) => AutomationPage(),
      AppRoutes.settings: (context) => Settings(),
      AppRoutes.devices: (context) => DevicesState(),
      AppRoutes.timePicker: (context) => TimePicker(),
      AppRoutes.datePicker: (context) => DatePicker(),
      AppRoutes.navbar: (context) => BottomNavbar()
    };

    WidgetBuilder builder = routes[settings.name] ?? routes.values.first;
    return MaterialPageRoute(builder: (ctx) => builder(ctx));
  }
}

class PageArguments {
  final String? pageTitle;
  final Map<String, dynamic>? data;

  PageArguments({
    this.pageTitle,
    this.data,
  });
}
