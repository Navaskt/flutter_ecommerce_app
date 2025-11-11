import '../../../../core/services/api_client.dart';
import '../../domain/repositories/product_repository.dart';
import '../models/product_model.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ApiClient client;

  ProductRepositoryImpl(this.client);

  @override
  Future<List<ProductModel>> getProducts() => client.getProducts();

  @override
  Future<ProductModel> getProductById(int id) => client.getProductById(id);
}