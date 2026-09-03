import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'product_repository.dart';
import 'app_theme.dart';
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
    final products = ProductRepository.all;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            title: const Text('Study with Campus'),
            actions: const [ThemeToggleButton(), SizedBox(width: 4)],
          ),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(20, 16, 20, 4),
            sliver: SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Stock the desk. Ace the semester.',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 6),
                  Text(
                    '${products.length} Campus essentials, official stock.',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(color: context.mutedText),
                  ),
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(20, 12, 20, 24),
            sliver: SliverLayoutBuilder(
              builder: (context, constraints) {
                final columns = _columnsForWidth(constraints.crossAxisExtent);
                return SliverGrid(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: columns,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 20,
                    childAspectRatio: 0.66,
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
    );
  }
}