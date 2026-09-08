/// A single stationery listing. Immutable on purpose — a [Product] never
/// changes after it's built, which is exactly why the widgets that
/// display it (ProductCard) can stay Stateless.
class Product {
  final String id;
  final String name;
  final String variant; // pattern / design / collab name, e.g. "Sasaki Mayu print"
  final double price;
  final String category;
  final double rating; // out of 5
  final int soldCount;
  final String description;
  final String imageUrl;

  const Product({
    required this.id,
    required this.name,
    required this.variant,
    required this.price,
    required this.category,
    required this.rating,
    required this.soldCount,
    required this.description,
    required this.imageUrl,
  });

  /// Philippine peso, rounded — matches how these are actually priced
  /// and shown on the source listings (e.g. "₱260", not "₱260.00").
  String get formattedPrice => '\u20b1${price.toStringAsFixed(0)}';

  String get formattedSoldCount =>
      soldCount >= 1000 ? '${(soldCount / 1000).toStringAsFixed(1)}k sold' : '$soldCount sold';
}