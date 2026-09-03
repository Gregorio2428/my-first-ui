import 'package:flutter/material.dart';

import 'product_repository.dart';
import 'product.dart';
import 'app_theme.dart';
/// Deliberately minimal for now — this half of the project only needs to
/// prove that Navigation 2.0 (go_router) correctly routes from a product
/// card to a details destination carrying that product's id.
///
/// The full layout (image, price, description, Add to Cart) is the next
/// half of the project. For now this confirms the right [Product] was
/// resolved from the `:id` path parameter and shows a quiet placeholder.
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
      appBar: AppBar(
        title: Text(product?.name ?? 'Product'),
      ),
      body: Center(
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
                'Product detail page — coming in the next part of the '
                'project (image, price, description, Add to Cart).',
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
    );
  }
}