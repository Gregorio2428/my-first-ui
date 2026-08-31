import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'platform_style.dart';
import 'dashboard_screen.dart';

void main() => runApp(const DashboardApp());

class DashboardApp extends StatelessWidget {
  const DashboardApp({super.key});

  @override
  Widget build(BuildContext context) {
    final os = currentOS();

    return ValueListenableBuilder<ThemeMode>(
      valueListenable: themeModeNotifier,
      builder: (context, mode, _) {
        final isDark = mode == ThemeMode.dark;

        if (os == TargetOS.ios) {
          return CupertinoApp(
            debugShowCheckedModeBanner: false,
            theme: CupertinoThemeData(
              brightness: isDark ? Brightness.dark : Brightness.light,
              primaryColor: CupertinoColors.activeBlue,
            ),
            home: DashboardScreen(os: os),
          );
        }

        return MaterialApp(
          debugShowCheckedModeBanner: false,
          themeMode: mode,
          theme: ThemeData(
            colorSchemeSeed: Colors.indigo,
            useMaterial3: true,
            brightness: Brightness.light,
            visualDensity: os == TargetOS.web ? VisualDensity.comfortable : VisualDensity.standard,
          ),
          darkTheme: ThemeData(
            colorSchemeSeed: Colors.indigo,
            useMaterial3: true,
            brightness: Brightness.dark,
          ),
          home: DashboardScreen(os: os),
        );
      },
    );
  }
}