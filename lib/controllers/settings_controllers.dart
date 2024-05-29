import 'package:vazifa5/models/settings.dart';
import 'package:flutter/material.dart';

class SettingsController with ChangeNotifier {
  final settings = Settings(themeMode: ThemeMode.system);

  void toggleThemeMode(bool isDark) {
    settings.themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}