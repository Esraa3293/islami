import 'package:flutter/material.dart';

class SettingsProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.light;
  Locale language = const Locale("en");

  void changeTheme(ThemeMode mode) {
    themeMode = mode;
    notifyListeners();
  }

  void changeLanguage(Locale lang) {
    language = lang;
    notifyListeners();
  }
}
