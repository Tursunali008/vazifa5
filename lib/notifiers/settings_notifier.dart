import 'package:vazifa5/controllers/settings_controllers.dart';
import 'package:flutter/material.dart';

class SettingsNotifier extends InheritedWidget {
  final SettingsController settingsController;

  const SettingsNotifier({
    super.key,
    required super.child,
    required this.settingsController,
  });

  @override
  bool updateShouldNotify(covariant SettingsNotifier oldWidget) {
    return oldWidget.settingsController != settingsController;
  }

  static SettingsController of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<SettingsNotifier>()!
        .settingsController;
  }
}
