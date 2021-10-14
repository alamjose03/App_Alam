import 'package:flutter/material.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:bellma/constants/colors_constant.dart';

class BottomNavDecorationsUI {
  static BottomNavyBarItem bottomNavyItem({
    required IconData icon,
    required String title,
  }) {
    return BottomNavyBarItem(
      icon: Icon(icon),
      title: Text(title),
      textAlign: TextAlign.center,
      activeColor: magentaColor,
      inactiveColor: greyColor,
    );
  }
}
