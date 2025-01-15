
import 'package:my_network_practice/products/data/models/product.dart';

abstract class ProductApi {

  Future<List<Product>> fetchProducts();
}