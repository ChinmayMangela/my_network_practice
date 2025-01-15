
import 'dart:convert';

import 'package:my_network_practice/products/data/api/products_api.dart';
import 'package:http/http.dart' as http;
import '../models/product.dart';

class ProductsApiImpl extends ProductApi {

  @override
  Future<List<Product>> fetchProducts() async {
    try {
      final response = await http.get(Uri.parse('https://dummyjson.com/products'));
      if(response.statusCode == 200) {
        final productsData = jsonDecode(response.body);
        final List<dynamic> products = productsData['products'];
        return products.map((product) => Product.fromJson(product)).toList();
      } else {
        throw Exception('Http Error: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to fetch products');
    }
  }
}