import 'package:flutter/material.dart';

class RangerTexts {
  final String _email = ' support@levven.com';
  final String _emailErr = 'Please enter a valid address';
  final String _errorMessage = 'Field must not be empty';
  final String _pinCodeError = 'Please enter a valid pin code';

  static const String macAddress = 'MAC Address';
  static const String helperTextAddress =
      'Enter last 6 characters 4827589XXXXXX';
  static const String pin = 'PIN';
  static const String helperTextPin = 'XXX-XXXX-XXX';
  static const String letsConnect = 'Let\'s get conected!';
  static const String cansel = 'Cansel';
  static const String ok = 'OK';
  static const String accessCamera = '"Levven" Would Like to Access the Camera';
  static const String scan = 'SCAN';
  static const String or = 'or';
  static const String dialogDescription = 'AlertDialog description';
  static const String enterManually = 'ENTER MANUALLY';
  static const String emailAdd = ' support@levven.com';
  static const String contact = 'contact us at';
  static const String gettingSetUp =
      'If you are having trouble getting set up, please ';
  static const String titleInfoPage = 'Enter Q Info';
  static const String submit = 'SUBMIT';

  static const String home = 'Home';
  static const String rooms = 'Rooms';
  static const String automations = 'Automations';
  static const String settings = 'More';

  static const String grove = '123 Oak Grove Dr.';
  static const String lightsOn = '4 lights on';
  static const String running = '1 fan running';
  static const String outlet = '1 outlet on';

  static const String favorite = 'Favorite';
  static const String addFav = 'ADD A FAVORITE';
  static const String favDevs = 'No favorite devices added yet';

  static const String indefinitePeriodOfTime = 'When...';
  static const String tigger = 'Select a tigger';
  static const String timer = 'Timer';
  static const String autoOff = 'Auto-off after ... 1h 3m';
  static const String timeOfDay = 'Time of Day';
  static const String time = 'e.g. sunrise, sunset, 6:45 pm';
  static const String save = 'Save';
  static const bool tr = true;

  static const String chooseTimer = 'Choose Timer';
  static const String chooseDay = 'Choose Days';
  static const String dialogAlert = 'dateDialog';

  String get email {
    return _email;
  }

  String get emailErr {
    return _emailErr;
  }

  String get errorMessage {
    return _errorMessage;
  }

  String get pinCodeError {
    return _pinCodeError;
  }
}
