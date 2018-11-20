import 'package:flutter/material.dart';

class GlobalConfig {
  static bool dark = true;

  static Color primaryColor =Color(0xff075E54);
  static Color accentColor = Color(0xff25D366);
  static ThemeData themeData =ThemeData(
    primaryColor: primaryColor,
    accentColor: accentColor,
  );

  static Color searchBackgroundColor = Colors.white10;
  static Color cardBackgroundColor = new Color(0xFF222222);
  static Color fontColor = Colors.white30;
}