import 'package:go_router/go_router.dart';

import '../../features/products/presentation/screens/product_screen.dart';
import '../../features/products/presentation/screens/product_detail_screen.dart';

final appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => ProductsScreen(),
      routes: [
        GoRoute(
          path: 'product/:id',
          builder: (context, state) {
            final id = int.parse(state.pathParameters['id']!);
            return ProductDetailScreen(productId: id);
          },
        ),
      ],
    ),
  ],
);
