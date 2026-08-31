import 'package:flutter/foundation.dart' show kIsWeb, ValueNotifier;
import 'package:flutter/material.dart' show ThemeMode;
import 'dart:io' show Platform;
import 'package:device_info_plus/device_info_plus.dart';

enum TargetOS { ios, android, web }

TargetOS currentOS() {
  if (kIsWeb) return TargetOS.web;
  if (Platform.isIOS) return TargetOS.ios;
  return TargetOS.android;
}

enum PlatformStyle { material, iosLegacy, iosModern }

Future<PlatformStyle> resolvePlatformStyle() async {
  if (kIsWeb || !Platform.isIOS) return PlatformStyle.material;
  try {
    final info = await DeviceInfoPlugin().iosInfo;
    final majorVersion = int.tryParse(info.systemVersion.split('.').first) ?? 0;
    return majorVersion >= 26 ? PlatformStyle.iosModern : PlatformStyle.iosLegacy;
  } catch (_) {
    return PlatformStyle.iosLegacy;
  }
}

/// Global light/dark mode switch, toggled from the Settings page.
final ValueNotifier<ThemeMode> themeModeNotifier = ValueNotifier(ThemeMode.light);