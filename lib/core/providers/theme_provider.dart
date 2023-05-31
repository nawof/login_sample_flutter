import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  bool _isLight = true;

  bool get isLight => _isLight;

  void changeTheme() {
    _isLight = !_isLight;
    notifyListeners();
  }

  ThemeMode getThemeMode() {
    if (_isLight) {
      return ThemeMode.light;
    } else {
      return ThemeMode.dark;
    }
  }
}
