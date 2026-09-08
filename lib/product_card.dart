import 'package:flutter/material.dart';

import 'product.dart';
import 'app_theme.dart';

/// Displays one [Product] in the Home grid.
///
/// This is deliberately a StatelessWidget: once a product is loaded, this
/// card's content never changes on its own — it just renders the same
/// static data every time, which is the textbook case for Stateless per
/// the brief ("a single product card's static display").
///
/// Layout note: the image sits in an [Expanded] region instead of a fixed
/// [AspectRatio]. A grid cell only ever gives this card one exact height
/// (from `childAspectRatio` in the SliverGrid) — forcing the image to a
/// *fixed* square on top of a *fixed*-height text block underneath means
/// their combined height can end up taller than that one exact height,
/// which is exactly what "RenderFlex overflowed" means. Expanded instead
/// lets the image take *whatever room is left* after the text block below
/// it takes what it needs, so the two always add up to the cell's real
/// height — it can't overflow, regardless of column count or font scaling.
class ProductCard extends StatelessWidget {
  final Product product;
  final VoidCallback onTap;

  const ProductCard({
    super.key,
    required this.product,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: _ProductImage(product: product),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 10, 12, 12),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: theme.textTheme.titleMedium,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 2),
                  Text(
                    product.variant,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: context.mutedText,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    product.formattedPrice,
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontFamily: theme.textTheme.bodyMedium?.fontFamily,
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(Icons.star_rounded,
                          size: 14, color: context.tagAccent),
                      const SizedBox(width: 2),
                      Text(
                        product.rating.toStringAsFixed(1),
                        style: theme.textTheme.bodySmall?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(width: 6),
                      Expanded(
                        child: Text(
                          product.formattedSoldCount,
                          style: theme.textTheme.bodySmall
                              ?.copyWith(color: context.mutedText),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ProductImage extends StatelessWidget {
  final Product product;
  const _ProductImage({required this.product});

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Image.network(
        product.imageUrl,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, progress) {
          if (progress == null) return child;
          return ColoredBox(
            color: Theme.of(context).colorScheme.surface,
            child: Center(
              child: SizedBox(
                width: 22,
                height: 22,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: context.tagAccent,
                  value: progress.expectedTotalBytes != null
                      ? progress.cumulativeBytesLoaded /
                          (progress.expectedTotalBytes ?? 1)
                      : null,
                ),
              ),
            ),
          );
        },
        errorBuilder: (context, error, stack) {
          // Offline fallback: a quiet notebook glyph instead of a broken-image icon.
          return ColoredBox(
            color: Theme.of(context).colorScheme.surface,
            child: Icon(
              Icons.menu_book_outlined,
              color: context.tagAccent,
              size: 32,
            ),
          );
        },
      ),
    );
  }
}