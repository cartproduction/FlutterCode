import 'models/ProductResponse.dart';
import 'package:dio/dio.dart';

class ProductApiProvider{
  final String _endpoint = "http://173.212.212.137:5000/api/categories/products/list";
  final Dio _dio = Dio();

  Future<ProductResponse> getProducts() async {
    try {
      Response response = await _dio.get(_endpoint);
      return ProductResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return ProductResponse.withError("$error");
    }
  }
}