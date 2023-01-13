import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData currentTheme;

  ThemeProvider({required bool isDarkMode}) //hacemos el constructor
      : currentTheme = isDarkMode ? ThemeData.dark() : ThemeData.light();
  /* Hacemos un setLight y un setDark */
  setLightMode() {
    currentTheme = ThemeData.light();
    notifyListeners();
  }

  setDarkMode() {
    currentTheme = ThemeData.dark();
    notifyListeners();
  }
}
