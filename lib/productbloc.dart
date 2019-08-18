import 'models/ProductResponse.dart';
import 'productrepository.dart';
import 'package:rxdart/rxdart.dart';

class ProductBloc {
  final ProductRepository _repository = ProductRepository();
  final BehaviorSubject<ProductResponse> _subject =
  BehaviorSubject<ProductResponse>();

  getProducts() async {
    ProductResponse response = await _repository.getProducts();
    _subject.sink.add(response);
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<ProductResponse> get subject => _subject;

}
final bloc = ProductBloc();