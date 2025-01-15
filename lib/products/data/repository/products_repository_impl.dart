import 'package:my_network_practice/products/data/api/products_api.dart';
import 'package:my_network_practice/products/domain/repository/products_repository.dart';

import '../../../shared/result.dart';
import '../models/product.dart';

class ProductsRepositoryImpl extends ProductsRepository {
  final ProductApi productApi;

  ProductsRepositoryImpl({
    required this.productApi,
  });

  @override
  Future<Result<List<Product>>> fetchProducts() async {
    try {
      final products = await productApi.fetchProducts();
      return Result.success(products);
    } catch (e) {
      return Result.failure(e.toString());
    }
  }
}
