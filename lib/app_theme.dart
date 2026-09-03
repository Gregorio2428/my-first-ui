import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

/// Everything visual lives here. No widget in this app should reach for
/// a raw Color or a raw font — they pull from Theme.of(context) instead,
/// so the light/dark toggle in the AppBar can flip the whole app at once.
class AppTheme {
  AppTheme._();

  /// Space Grotesk carries the personality: a technical, slightly
  /// geometric display face that reads like it belongs on a well-made
  /// notebook cover rather than a generic storefront.
  static TextStyle _display(Color color) => GoogleFonts.spaceGrotesk(
        color: color,
        fontWeight: FontWeight.w600,
        letterSpacing: -0.2,
      );

  /// IBM Plex Sans is the quiet workhorse for prices, labels, and body
  /// copy — an academic, technical typeface built for exactly this kind
  /// of studious, functional subject matter.
  static TextTheme _bodyTextTheme(TextTheme base, Color color) {
    return GoogleFonts.ibmPlexSansTextTheme(base).apply(
      bodyColor: color,
      displayColor: color,
    );
  }

  static ThemeData light() {
    const scheme = ColorScheme.light(
      brightness: Brightness.light,
      primary: AppColors.lightCobalt,
      onPrimary: Colors.white,
      secondary: AppColors.lightMustard,
      onSecondary: AppColors.lightInk,
      surface: AppColors.lightSurface,
      onSurface: AppColors.lightInk,
      error: AppColors.lightDiscount,
      onError: Colors.white,
    );

    final base = ThemeData(brightness: Brightness.light, useMaterial3: true);
    final textTheme = _bodyTextTheme(base.textTheme, AppColors.lightInk)
        .copyWith(
      headlineSmall: _display(AppColors.lightInk).copyWith(fontSize: 26),
      titleLarge: _display(AppColors.lightInk).copyWith(fontSize: 20),
      titleMedium: _display(AppColors.lightInk).copyWith(fontSize: 16),
    );

    return base.copyWith(
      colorScheme: scheme,
      scaffoldBackgroundColor: AppColors.lightBackground,
      textTheme: textTheme,
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.lightBackground,
        foregroundColor: AppColors.lightInk,
        elevation: 0,
        scrolledUnderElevation: 0.5,
        titleTextStyle: _display(AppColors.lightInk).copyWith(fontSize: 21),
      ),
      cardTheme: const CardThemeData(
        color: AppColors.lightSurface,
        elevation: 0,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          side: BorderSide(color: AppColors.lightHairline, width: 1),
        ),
      ),
      dividerTheme: const DividerThemeData(
        color: AppColors.lightHairline,
        thickness: 1,
        space: 1,
      ),
      iconTheme: const IconThemeData(color: AppColors.lightCobalt),
      extensions: const [
        _MutedTextColor(AppColors.lightMuted),
        _TagAccent(AppColors.lightMustard),
        _DiscountColor(AppColors.lightDiscount),
      ],
    );
  }

  static ThemeData dark() {
    const scheme = ColorScheme.dark(
      brightness: Brightness.dark,
      primary: AppColors.darkSky,
      onPrimary: AppColors.darkBackground,
      secondary: AppColors.darkMustard,
      onSecondary: AppColors.darkBackground,
      surface: AppColors.darkSurface,
      onSurface: AppColors.darkInk,
      error: AppColors.darkDiscount,
      onError: AppColors.darkBackground,
    );

    final base = ThemeData(brightness: Brightness.dark, useMaterial3: true);
    final textTheme = _bodyTextTheme(base.textTheme, AppColors.darkInk)
        .copyWith(
      headlineSmall: _display(AppColors.darkInk).copyWith(fontSize: 26),
      titleLarge: _display(AppColors.darkInk).copyWith(fontSize: 20),
      titleMedium: _display(AppColors.darkInk).copyWith(fontSize: 16),
    );

    return base.copyWith(
      colorScheme: scheme,
      scaffoldBackgroundColor: AppColors.darkBackground,
      textTheme: textTheme,
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.darkBackground,
        foregroundColor: AppColors.darkInk,
        elevation: 0,
        scrolledUnderElevation: 0.5,
        titleTextStyle: _display(AppColors.darkInk).copyWith(fontSize: 21),
      ),
      cardTheme: const CardThemeData(
        color: AppColors.darkSurface,
        elevation: 0,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          side: BorderSide(color: AppColors.darkHairline, width: 1),
        ),
      ),
      dividerTheme: const DividerThemeData(
        color: AppColors.darkHairline,
        thickness: 1,
        space: 1,
      ),
      iconTheme: const IconThemeData(color: AppColors.darkSky),
      extensions: const [
        _MutedTextColor(AppColors.darkMuted),
        _TagAccent(AppColors.darkMustard),
        _DiscountColor(AppColors.darkDiscount),
      ],
    );
  }
}

/// Small ThemeExtensions so widgets can ask Theme.of(context) for the
/// "muted" caption color, the mustard "tag" accent, and the sale-price
/// color without ever hardcoding a Color themselves.
class _MutedTextColor extends ThemeExtension<_MutedTextColor> {
  final Color color;
  const _MutedTextColor(this.color);

  @override
  _MutedTextColor copyWith({Color? color}) =>
      _MutedTextColor(color ?? this.color);

  @override
  _MutedTextColor lerp(ThemeExtension<_MutedTextColor>? other, double t) {
    if (other is! _MutedTextColor) return this;
    return _MutedTextColor(Color.lerp(color, other.color, t)!);
  }
}

class _TagAccent extends ThemeExtension<_TagAccent> {
  final Color color;
  const _TagAccent(this.color);

  @override
  _TagAccent copyWith({Color? color}) => _TagAccent(color ?? this.color);

  @override
  _TagAccent lerp(ThemeExtension<_TagAccent>? other, double t) {
    if (other is! _TagAccent) return this;
    return _TagAccent(Color.lerp(color, other.color, t)!);
  }
}

class _DiscountColor extends ThemeExtension<_DiscountColor> {
  final Color color;
  const _DiscountColor(this.color);

  @override
  _DiscountColor copyWith({Color? color}) =>
      _DiscountColor(color ?? this.color);

  @override
  _DiscountColor lerp(ThemeExtension<_DiscountColor>? other, double t) {
    if (other is! _DiscountColor) return this;
    return _DiscountColor(Color.lerp(color, other.color, t)!);
  }
}

/// Convenience getters so call sites read `context.mutedText` instead of
/// digging through `Theme.of(context).extension<...>()` every time.
extension AppThemeContext on BuildContext {
  Color get mutedText =>
      Theme.of(this).extension<_MutedTextColor>()?.color ??
      Theme.of(this).colorScheme.onSurface;

  Color get tagAccent =>
      Theme.of(this).extension<_TagAccent>()?.color ??
      Theme.of(this).colorScheme.secondary;

  Color get discountColor =>
      Theme.of(this).extension<_DiscountColor>()?.color ??
      Theme.of(this).colorScheme.error;
}