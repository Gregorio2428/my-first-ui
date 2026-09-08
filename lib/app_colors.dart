import 'package:flutter/material.dart';

/// Study with Campus's palette is pulled directly from the brand board:
/// a deep cobalt blue, a dustier sky teal, a pale seafoam, and a warm
/// paper cream — the same four swatches, used consistently instead of
/// a generic black+white storefront. Notebook grid-paper cream sits
/// behind everything; the blue/teal pair carries branding, buttons and
/// active states; the seafoam softens hairlines, chips and glows.
class AppColors {
  AppColors._();

  // --- Palette source swatches (kept exact, referenced by both themes) ---
  static const Color cobalt = Color(0xFF3368A0); // brand primary
  static const Color skyTeal = Color(0xFF66A3BF); // brand secondary
  static const Color seafoam = Color(0xFFC8DFDB); // soft accent / glow
  static const Color paperCream = Color(0xFFF2EFE7); // brand background

  // --- Light theme ---
  static const Color lightBackground = paperCream;
  static const Color lightSurface = Color(0xFFFFFFFF);
  static const Color lightPrimary = cobalt;
  static const Color lightAccent = skyTeal;
  static const Color lightInk = Color(0xFF1B2B3A);
  static const Color lightMuted = Color(0xFF5D7A89);
  static const Color lightHairline = Color(0xFFDCEAE7);

  // --- Dark theme ---
  static const Color darkBackground = Color(0xFF0F2436);
  static const Color darkSurface = Color(0xFF163449);
  static const Color darkPrimary = Color(0xFF8FC1DA);
  static const Color darkAccent = Color(0xFF9AD1C9);
  static const Color darkInk = Color(0xFFEDEFF3);
  static const Color darkMuted = Color(0xFF9FB4C2);
  static const Color darkHairline = Color(0xFF23445C);
}