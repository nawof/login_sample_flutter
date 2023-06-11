import 'package:flutter/material.dart';
import 'package:login_statefull/core/theme/my_theme.dart';

enum ThemeColor {
  red,
  green,
  blue,
  black,
}

class ThemeProvider extends ChangeNotifier {
  ThemeColor selectedTheme = ThemeColor.blue;

  void setTheme(ThemeColor color) {
    selectedTheme = color;
    notifyListeners();
  }

  ThemeData getTheme() {
    switch (selectedTheme) {
      case ThemeColor.red:
        return MyTheme.redTheme;
      case ThemeColor.blue:
        return MyTheme.blueTheme;
      case ThemeColor.green:
        return MyTheme.greenTheme;
      case ThemeColor.black:
        return MyTheme.darkTheme;
      default:
        return MyTheme.blueTheme;
    }
  }
}
