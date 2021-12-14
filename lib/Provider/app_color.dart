import 'package:flutter/material.dart';

class Colorss with ChangeNotifier {
  static bool _isDarkMode = false;

  static Color primaryColor =
      (_isDarkMode) ? _darkPrimaryColor : _lightPrimaryColor;
  static Color textColor = (_isDarkMode) ? _darkTextColor : _lightTextColor;
  static Color blueColor = Color(0xFF48BDFF);
  static Color amberColor = Color(0xFFFFA048);

  static final Color _lightPrimaryColor = Color(0xFFE9EDF0);
  static final Color _lightTextColor = Color(0xFF636363);

  static final Color _darkPrimaryColor = Color(0xFFE9EDF0);
  static final Color _darkTextColor = Color(0xFFE9EDF0);

  static void setDarkMode() => _isDarkMode = !_isDarkMode;
}
