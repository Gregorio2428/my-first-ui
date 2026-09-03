import 'package:flutter/material.dart';

/// Study with Campus's palette leans on the actual brand color on the
/// source listings — Campus's own cobalt blue — paired with a warm
/// mustard rather than the generic cream+terracotta or black+neon
/// combinations. It should read like a well-kept notebook, not a
/// generic storefront.
class AppColors {
  AppColors._();

  // --- Light theme ---
  static const Color lightBackground = Color(0xFFF4F6F8); // graph-paper white
  static const Color lightSurface = Color(0xFFFFFFFF);
  static const Color lightCobalt = Color(0xFF1D4E89); // primary, Campus blue
  static const Color lightMustard = Color(0xFFC98A1F); // accent
  static const Color lightInk = Color(0xFF1A1D22);
  static const Color lightMuted = Color(0xFF5B6270);
  static const Color lightHairline = Color(0xFFD9DEE4);
  static const Color lightDiscount = Color(0xFFC24A3B); // sale-price red

  // --- Dark theme ---
  static const Color darkBackground = Color(0xFF10172A); // late-night desk
  static const Color darkSurface = Color(0xFF19223B);
  static const Color darkSky = Color(0xFF8FB6E8); // primary in dark
  static const Color darkMustard = Color(0xFFE3B15B);
  static const Color darkInk = Color(0xFFEDEFF3);
  static const Color darkMuted = Color(0xFFA6ADBB);
  static const Color darkHairline = Color(0xFF2B3552);
  static const Color darkDiscount = Color(0xFFE8776A);
}