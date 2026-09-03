import 'package:flutter/material.dart';

import 'theme_controller.dart';

/// The one interactive piece of chrome in the AppBar. Reads its icon from
/// [ThemeController] and calls [ThemeController.toggle] on tap, which
/// flips the whole app's ThemeData immediately via MaterialApp.themeMode.
class ThemeToggleButton extends StatelessWidget {
  const ThemeToggleButton({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = ThemeController.of(context);
    return IconButton(
      tooltip: controller.isDark ? 'Switch to day mode' : 'Switch to night mode',
      icon: Icon(controller.isDark ? Icons.wb_sunny_outlined : Icons.nights_stay_outlined),
      onPressed: controller.toggle,
    );
  }
}