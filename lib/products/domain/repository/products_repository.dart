
import 'package:my_network_practice/products/data/models/product.dart';
import 'package:my_network_practice/shared/result.dart';

abstract class ProductsRepository {

  Future<Result<List<Product>>> fetchProducts();
}