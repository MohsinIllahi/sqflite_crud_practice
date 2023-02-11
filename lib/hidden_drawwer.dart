// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';
import 'package:sqflite_crud_practice/screens/practice_ui.dart';
import 'package:sqflite_crud_practice/screens/settings_page.dart';

class HiddenDrawer extends StatefulWidget {
  const HiddenDrawer({super.key});

  @override
  State<HiddenDrawer> createState() => _HiddenDrawerState();
}

class _HiddenDrawerState extends State<HiddenDrawer> {
  final mytextstyle = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 18,
    color: Colors.white,
  );
  List<ScreenHiddenDrawer> _pages = [];
  @override
  void initState() {
    super.initState();
    _pages = [
      ScreenHiddenDrawer(
          ItemHiddenMenu(
              colorLineSelected: Colors.white,
              name: 'Home Page',
              baseStyle: mytextstyle,
              selectedStyle: mytextstyle),
          PracticeUI()),
      ScreenHiddenDrawer(
          ItemHiddenMenu(
              colorLineSelected: Colors.white,
              name: 'Settings Page',
              baseStyle: mytextstyle,
              selectedStyle: mytextstyle),
          SettingsPage()),
      //   ScreenHiddenDrawer(
      // ItemHiddenMenu(
      //     colorLineSelected: Colors.white,
      //     name: 'Home Page',
      //     baseStyle: TextStyle(),
      //     selectedStyle: TextStyle()),
      // ThirdScreen()),
    ];
  }

  Widget build(BuildContext context) {
    return HiddenDrawerMenu(
      contentCornerRadius: 10.0,
      enableCornerAnimation: true,
      slidePercent: 60.0,
      backgroundColorMenu: Colors.deepPurple.withOpacity(0.5),
      screens: _pages,
      initPositionSelected: 0,
    );
  }
}
