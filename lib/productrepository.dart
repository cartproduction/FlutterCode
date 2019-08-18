import 'models/ProductResponse.dart';
import 'apiclient.dart';

class ProductRepository{
  ProductApiProvider _apiProvider = ProductApiProvider();

  Future<ProductResponse> getProducts(){
    return _apiProvider.getProducts();
  }
}