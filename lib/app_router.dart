import 'package:go_router/go_router.dart';

import 'home_screen.dart';
import 'product_detail_screen.dart';

/// Navigation 2.0 route table for the app. The Home screen pushes to
/// `/product/:id`; the id is resolved back to a [Product] inside
/// [ProductDetailScreen] itself, so this file stays a pure route map.
final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: 'home',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/product/:id',
      name: 'productDetail',
      builder: (context, state) {
        final productId = state.pathParameters['id']!;
        return ProductDetailScreen(productId: productId);
      },
    ),
  ],
);