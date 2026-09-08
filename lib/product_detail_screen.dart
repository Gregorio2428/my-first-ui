import 'package:flutter/material.dart';

import 'product_repository.dart';
import 'product.dart';
import 'app_background.dart';
import 'app_theme.dart';

/// Shows the catalog description for the product resolved from the `:id`
/// route parameter.
class ProductDetailScreen extends StatelessWidget {
  final String productId;

  const ProductDetailScreen({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    Product? product;
    for (final p in ProductRepository.all) {
      if (p.id == productId) {
        product = p;
        break;
      }
    }

    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(product?.name ?? 'Product'),
      ),
      body: AppBackground(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.menu_book_outlined,
                  size: 40,
                  color: context.tagAccent,
                ),
                const SizedBox(height: 16),
                Text(
                  product?.name ?? 'Unknown item',
                  style: Theme.of(context).textTheme.titleLarge,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Text(
                  product?.description ?? 'Product description unavailable.',
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: context.mutedText),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}