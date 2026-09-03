import 'package:flutter/material.dart';

import 'app_router.dart';
import 'app_theme.dart';
import 'theme_controller.dart';

void main() {
  runApp(const StudyWithCampusApp());
}

class StudyWithCampusApp extends StatelessWidget {
  const StudyWithCampusApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ThemeController(
      child: Builder(
        builder: (context) {
          final controller = ThemeController.of(context);
          return MaterialApp.router(
            title: 'Study with Campus',
            debugShowCheckedModeBanner: false,
            theme: AppTheme.light(),
            darkTheme: AppTheme.dark(),
            themeMode: controller.mode,
            routerConfig: appRouter,
          );
        },
      ),
    );
  }
}