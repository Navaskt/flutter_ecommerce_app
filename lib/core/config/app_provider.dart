import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../services/api_client.dart';

// Dio Provider
final dioProvider = Provider((ref) => Dio());

// ApiClient Provider
final apiClientProvider = Provider<ApiClient>((ref) {
  final dio = ref.watch(dioProvider);
  return ApiClient(dio, baseUrl: "https://mockapi.io/");
});
