import 'package:vazifa5/notifiers/settings_notifier.dart';
import 'package:vazifa5/views/widgets/costom_driver.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      drawer: const CustomDrawer(),
      body: ListView(
        children: [
          ListenableBuilder(
            listenable: SettingsNotifier.of(context),
            builder: (context, child) {
              return SwitchListTile(
                value: SettingsNotifier.of(context).settings.themeMode ==
                    ThemeMode.dark,
                onChanged: SettingsNotifier.of(context).toggleThemeMode,
                title: const Text("Dakr Mode"),
              );
            },
          ),
        ],
      ),
    );
  }
}
