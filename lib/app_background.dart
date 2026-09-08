import 'package:flutter/material.dart';

import 'app_theme.dart';

/// The page background behind every screen in the shop.
///
/// Instead of a flat scaffold color, this paints three things, back to
/// front: the theme's base color (cream in light mode, deep navy in
/// dark), two soft out-of-focus color blobs in the brand's blue/teal
/// pair, and a faint dot grid reminiscent of graph-paper notebook
/// stock. It's deliberately quiet — content on top should always read
/// first — but it keeps the app from ever looking like a bare white
/// (or bare black) screen.
class AppBackground extends StatelessWidget {
  final Widget child;

  const AppBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final soft = context.brandGlowSoft;
    final bold = context.brandGlowBold;
    final baseColor = Theme.of(context).scaffoldBackgroundColor;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return DecoratedBox(
      decoration: BoxDecoration(color: baseColor),
      child: Stack(
        fit: StackFit.expand,
        children: [
          // Large, softly-blurred blobs in the two brand hues, tucked
          // into the corners so the centre of the screen — where the
          // grid and cards live — stays clean and legible.
          Positioned(
            top: -110,
            right: -90,
            child: _Blob(
              color: bold.withOpacity(isDark ? 0.22 : 0.16),
              size: 280,
            ),
          ),
          Positioned(
            top: 160,
            left: -130,
            child: _Blob(
              color: soft.withOpacity(isDark ? 0.16 : 0.5),
              size: 260,
            ),
          ),
          Positioned(
            bottom: -140,
            right: -60,
            child: _Blob(
              color: soft.withOpacity(isDark ? 0.12 : 0.35),
              size: 320,
            ),
          ),
          // A faint dot grid over everything, evoking graph-paper /
          // notebook stock without ever competing with real content.
          Positioned.fill(
            child: CustomPaint(
              painter: _DotGridPainter(
                dotColor: bold.withOpacity(isDark ? 0.10 : 0.09),
              ),
            ),
          ),
          child,
        ],
      ),
    );
  }
}

class _Blob extends StatelessWidget {
  final Color color;
  final double size;
  const _Blob({required this.color, required this.size});

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: RadialGradient(
            colors: [color, color.withOpacity(0)],
          ),
        ),
      ),
    );
  }
}

class _DotGridPainter extends CustomPainter {
  final Color dotColor;
  static const double _spacing = 22;
  static const double _dotRadius = 1.1;

  _DotGridPainter({required this.dotColor});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = dotColor;
    for (double y = 0; y < size.height; y += _spacing) {
      for (double x = 0; x < size.width; x += _spacing) {
        canvas.drawCircle(Offset(x, y), _dotRadius, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant _DotGridPainter oldDelegate) =>
      oldDelegate.dotColor != dotColor;
}