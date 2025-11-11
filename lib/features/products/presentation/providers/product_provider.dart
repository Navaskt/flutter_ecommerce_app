import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/config/app_provider.dart';
import '../../data/repositories/product_repository_impl.dart';
import '../../domain/repositories/product_repository.dart';
import '../../data/models/product_model.dart';

final productRepositoryProvider = Provider<ProductRepository>((ref) {
  final apiClient = ref.watch(apiClientProvider);
  return ProductRepositoryImpl(apiClient);
});

final productsProvider = FutureProvider<List<ProductModel>>((ref) {
  final repo = ref.watch(productRepositoryProvider);
  return repo.getProducts();
});

final productDetailProvider = FutureProvider.family<ProductModel, int>((ref, id) {
  final repo = ref.watch(productRepositoryProvider);
  return repo.getProductById(id);
});