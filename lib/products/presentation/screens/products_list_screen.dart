import 'package:flutter/material.dart';
import 'package:my_network_practice/products/data/api/products_api_impl.dart';
import 'package:my_network_practice/products/data/repository/products_repository_impl.dart';
import 'package:my_network_practice/products/presentation/widgets/products_grid.dart';
import 'package:my_network_practice/shared/result.dart';

class ProductsGridScreen extends StatelessWidget {
  const ProductsGridScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    final productsRepository = ProductsRepositoryImpl(
      productApi: ProductsApiImpl(),
    );
    return FutureBuilder(
      future: productsRepository.fetchProducts(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasData) {
          final result = snapshot.data;
          if (result!.state == ResultState.success) {
            return ProductsGrid(products: result.data!);
          } else {
            print('Error in Result: ${result.message}');
            return Center(child: Text('${result.message}'));
          }
        } else if (snapshot.hasError) {
          print('Snapshot error: ${snapshot.error}');
          return Center(child: Text('Error: ${snapshot.error}'));
        } else {
          return Center(child: Text('Something went wrong!'));
        }
      },
    );
  }
}
