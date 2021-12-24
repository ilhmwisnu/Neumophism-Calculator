import 'package:flutter/material.dart';

class Colorss with ChangeNotifier {
  static bool _isDarkMode = false;

  Color primaryColor = Color(0xFFE9EDF0);
  Color textColor = Color(0xFF848484);
  Color blueColor = Color(0xFF48BDFF);
  Color amberColor = Color(0xFFFFA048);
  Color whiteColor = Colors.white;
  Color blackColor = Colors.black;

  // static final Color _lightPrimaryColor = Color(0xFFE9EDF0);
  // static final Color _lightTextColor = Color(0xFF848484);

  // static final Color _darkPrimaryColor = Color(0xFFE9EDF0);
  // static final Color _darkTextColor = Color(0xFFE9EDF0);

  bool get isDarkMode => _isDarkMode;

  void setDarkMode() {
    if (_isDarkMode) {
      primaryColor = Color(0xFFE9EDF0);
      textColor = Color(0xFF848484);
      blackColor = Colors.black;
      whiteColor = Colors.white;
    } else {
      primaryColor = Color(0xFF212121);
      textColor = Color(0xFFE9EDF0);
      blackColor = Colors.white;
      whiteColor = Colors.black;
    }
    _isDarkMode = !_isDarkMode;
    notifyListeners();
    // print('ahlo');
    // print(_isDarkMode);
  }
}
