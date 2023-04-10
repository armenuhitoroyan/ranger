import 'package:flutter/material.dart';
import 'package:ranger/config/str.dart';

import '../../config/colors.dart';
import '../../pages/automations/searching/search_words.dart';
import '../../pages/devices/devices.dart';
import '../../pages/rooms/rooms.dart';
import '../../pages/settings/settings.dart';

class BottomNavbar extends StatefulWidget {
  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  int _selectedIndex = 0;
  static final List<Widget> _widgetOptions = [
    DevicesState(),
    Rooms(),
    SearchWords(),
    Settings(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: RangerColors.blueBtn,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.white,
        showUnselectedLabels: false,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: RangerTexts.home,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.branding_watermark_outlined,
            ),
            label: RangerTexts.rooms,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.play_circle_outline,
            ),
            label: RangerTexts.automations,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.more_vert,
            ),
            label: RangerTexts.settings,
          ),
        ],
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
    );
  }

  _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    print(_selectedIndex);

    return _selectedIndex;
  }
}
