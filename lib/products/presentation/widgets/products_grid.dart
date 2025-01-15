import 'package:flutter/material.dart';
import 'package:my_network_practice/products/data/models/product.dart';
import 'package:my_network_practice/products/presentation/widgets/product_card.dart';

class ProductsGrid extends StatelessWidget {
  const ProductsGrid({
    super.key,
    required this.products,
  });

  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 0.65,
          ),
      itemBuilder: (context, index) {
        final currentProduct = products[index];
        return ProductCard(
          product: currentProduct,
        );
      },
      itemCount: products.length,
    );
  }
}
