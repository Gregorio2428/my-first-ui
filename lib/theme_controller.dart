import 'package:flutter/material.dart';

/// This is the one deliberately Stateful piece of chrome in the theme
/// layer: the light/dark toggle changes based on user interaction, so
/// (per the brief) it earns a StatefulWidget with real state, instead of
/// being just another Stateless display.
///
/// [ThemeController] owns the current [ThemeMode] and wraps [child] in an
/// [_ThemeControllerScope] so any descendant — most importantly the
/// AppBar toggle button on the Home screen — can read the current mode
/// and flip it via [ThemeController.of(context).toggle()].
class ThemeController extends StatefulWidget {
  final Widget child;
  final ThemeMode initialMode;

  const ThemeController({
    super.key,
    required this.child,
    this.initialMode = ThemeMode.light,
  });

  static _ThemeControllerState of(BuildContext context) {
    final scope =
        context.dependOnInheritedWidgetOfExactType<_ThemeControllerScope>();
    assert(scope != null, 'No ThemeController found in context');
    return scope!.state;
  }

  @override
  State<ThemeController> createState() => _ThemeControllerState();
}

class _ThemeControllerState extends State<ThemeController> {
  late ThemeMode _mode = widget.initialMode;

  ThemeMode get mode => _mode;
  bool get isDark => _mode == ThemeMode.dark;

  void toggle() {
    setState(() {
      _mode = _mode == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _ThemeControllerScope(state: this, mode: _mode, child: widget.child);
  }
}

class _ThemeControllerScope extends InheritedWidget {
  final _ThemeControllerState state;
  // Captured separately from `state.mode` on purpose: `state` is the same
  // object on every rebuild, so comparing state.mode against itself in
  // updateShouldNotify would always read as "unchanged". This plain field
  // snapshots the mode at build time so the old vs. new comparison below
  // is meaningful.
  final ThemeMode mode;

  const _ThemeControllerScope({
    required this.state,
    required this.mode,
    required super.child,
  });

  @override
  bool updateShouldNotify(_ThemeControllerScope oldWidget) =>
      oldWidget.mode != mode;
}