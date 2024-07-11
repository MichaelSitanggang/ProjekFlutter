import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  double _darkModeValue = 0;

  double get darkModeValue => _darkModeValue;

  bool get isDarkMode => _darkModeValue == 1;

  set darkModeValue(double value) {
    _darkModeValue = value;
    notifyListeners();
  }

  void toggleTheme() {
    _darkModeValue = _darkModeValue == 1 ? 0 : 1;
    notifyListeners();
  }
}
