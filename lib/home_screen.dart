import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'product_repository.dart';
import 'app_background.dart';
import 'app_theme.dart';
import 'brand_wordmark.dart';
import 'product_card.dart';
import 'theme_toggle_button.dart';

/// The Home / product grid screen.
///
/// Responsiveness rule from the brief: 2 columns on phone-width screens,
/// at least 3 on tablet-width screens. [SliverLayoutBuilder] (the sliver
/// counterpart of LayoutBuilder) is used here instead of MediaQuery
/// because the grid only cares about the width it's actually given
/// inside the Scaffold body, not the full device/window width — the same
/// logic keeps working if this screen is ever embedded in a split view or
/// a side panel.
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  int _columnsForWidth(double width) {
    if (width >= 900) return 4;
    if (width >= 600) return 3; // tablet-width floor from the brief
    return 2; // phone-width
  }

  @override
  Widget build(BuildContext context) {
    const products = ProductRepository.all;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: AppBackground(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              backgroundColor: Colors.transparent,
              // No title here on purpose: the full wordmark lives in the
              // gradient masthead just below, in its light/white form. A
              // second, dark-ink copy pinned in this app bar would end up
              // scrolling on top of that same gradient (this bar stays
              // fixed while the masthead scrolls under it) and become
              // unreadable against it.
              actions: const [ThemeToggleButton(), SizedBox(width: 4)],
            ),
            SliverToBoxAdapter(
              child: _WaveMasthead(itemCount: products.length),
            ),
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 24),
              sliver: SliverLayoutBuilder(
                builder: (context, constraints) {
                  final columns = _columnsForWidth(constraints.crossAxisExtent);
                  return SliverGrid(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: columns,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 20,
                      childAspectRatio: 0.6,
                    ),
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        final product = products[index];
                        return ProductCard(
                          product: product,
                          onTap: () =>
                              context.push('/product/${product.id}'),
                        );
                      },
                      childCount: products.length,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// The gradient masthead beneath the AppBar: the "Stock the desk. Ace
/// the semester." tagline dressed as a wave-bottomed blue-to-teal panel,
/// with the full wordmark inside it, rather than plain text sitting on
/// the page background.
class _WaveMasthead extends StatelessWidget {
  final int itemCount;
  const _WaveMasthead({required this.itemCount});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ClipPath(
      clipper: _WaveClipper(),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 56),
        decoration: BoxDecoration(
          gradient: AppTheme.headerGradient,
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              right: -14,
              top: -6,
              child: Icon(
                Icons.school_rounded,
                size: 84,
                color: Colors.white.withOpacity(0.14),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const BrandWordmark(light: true, scale: 1.05),
                const SizedBox(height: 18),
                Text(
                  'Stock the desk. Ace the semester.',
                  style: theme.textTheme.headlineSmall?.copyWith(
                    color: Colors.white,
                    fontSize: 22,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  '$itemCount Campus essentials, official stock.',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: Colors.white.withOpacity(0.92),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

/// A soft, single-crest wave for the bottom edge of the masthead panel,
/// instead of a flat or plain-rounded edge — it's what turns the panel
/// into a considered piece of page design instead of a coloured box.
class _WaveClipper extends CustomClipper<Path> {
  const _WaveClipper();

  @override
  Path getClip(Size size) {
    final path = Path()..lineTo(0, size.height - 40);
    path.quadraticBezierTo(
      size.width * 0.25,
      size.height,
      size.width * 0.5,
      size.height - 18,
    );
    path.quadraticBezierTo(
      size.width * 0.75,
      size.height - 36,
      size.width,
      size.height - 4,
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}