import 'package:flutter/material.dart';

import 'app_theme.dart';

/// The "Study with Campus" wordmark: a tilted gradient notebook-glyph
/// badge next to a two-line logo lockup ("Study with" over a bold
/// "Campus"), with a small hand-drawn squiggle underlining "Campus" —
/// so the brand reads as a considered mark instead of a plain title
/// string.
///
/// [light] switches the text/squiggle to white-on-color for use over a
/// gradient panel (e.g. the hero masthead); the default is tuned for
/// sitting directly on the page background.
class BrandWordmark extends StatelessWidget {
  final bool light;
  final double scale;

  const BrandWordmark({super.key, this.light = false, this.scale = 1.0});

  @override
  Widget build(BuildContext context) {
    final bold = context.brandGlowBold;
    final accent = context.tagAccent;
    final markSize = 34.0 * scale;

    final studyWithColor = light ? Colors.white70 : context.mutedText;
    final campusColor = light ? Colors.white : bold;
    final squiggleColor = light ? Colors.white : accent;

    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Transform.rotate(
          angle: -0.09,
          child: Container(
            width: markSize,
            height: markSize,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [bold, accent],
              ),
              borderRadius: BorderRadius.circular(10),
              border: light
                  ? Border.all(color: Colors.white.withOpacity(0.55), width: 1.4)
                  : null,
              boxShadow: [
                BoxShadow(
                  color: bold.withOpacity(0.35),
                  blurRadius: 10,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Icon(
              Icons.menu_book_rounded,
              color: Colors.white,
              size: markSize * 0.56,
            ),
          ),
        ),
        SizedBox(width: 10 * scale),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Study with',
              style: TextStyle(
                color: studyWithColor,
                fontSize: 12 * scale,
                fontWeight: FontWeight.w500,
                height: 1,
              ),
            ),
            SizedBox(height: 2 * scale),
            IntrinsicWidth(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Campus',
                    style: TextStyle(
                      color: campusColor,
                      fontSize: 20 * scale,
                      fontWeight: FontWeight.w700,
                      height: 1.05,
                      letterSpacing: -0.2,
                    ),
                  ),
                  SizedBox(height: 3 * scale),
                  SizedBox(
                    height: 5 * scale,
                    width: double.infinity,
                    child: CustomPaint(
                      painter: _SquigglePainter(color: squiggleColor),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

/// A tiny hand-drawn-looking underline stroke, sized to exactly the
/// width of the "Campus" text above it via [IntrinsicWidth].
class _SquigglePainter extends CustomPainter {
  final Color color;
  const _SquigglePainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 2.2
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final path = Path()
      ..moveTo(0, size.height * 0.7)
      ..quadraticBezierTo(
        size.width * 0.25,
        0,
        size.width * 0.5,
        size.height * 0.6,
      )
      ..quadraticBezierTo(
        size.width * 0.75,
        size.height * 1.3,
        size.width,
        size.height * 0.4,
      );

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant _SquigglePainter oldDelegate) =>
      oldDelegate.color != color;
}