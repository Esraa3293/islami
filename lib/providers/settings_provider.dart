import 'package:flutter/material.dart';
import 'package:islami_new/shared_preferences.dart';

class SettingsProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.light;
  Locale language = const Locale("en");

  void init() {
    String theme = SharedPrefs.getTheme();
    if (theme == "light") {
      themeMode = ThemeMode.light;
    } else {
      themeMode = ThemeMode.dark;
    }

    String lang = SharedPrefs.getLanguage();
    if (lang == "en") {
      language = const Locale("en");
    } else {
      language = const Locale("ar");
    }
  }

  Future<void> changeTheme(ThemeMode mode) async {
    themeMode = mode;
    if (mode == ThemeMode.light) {
      await SharedPrefs.setTheme("light");
    } else {
      await SharedPrefs.setTheme("dark");
    }
    notifyListeners();
  }

  Future<void> changeLanguage(Locale lang) async {
    language = lang;
    if (lang.languageCode == "en") {
      await SharedPrefs.setLanguage("en");
    } else {
      await SharedPrefs.setLanguage("ar");
    }
    notifyListeners();
  }
}
