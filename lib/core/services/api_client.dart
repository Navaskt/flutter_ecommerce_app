import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../../features/products/data/models/product_model.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: "https://mockapi.io/")
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @GET('/products')
  Future<List<ProductModel>> getProducts();

  @GET('/products/{id}')
  Future<ProductModel> getProductById(@Path("id") int id);
}