import 'package:flutter/material.dart';
import 'package:my_network_practice/products/data/models/product.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.black,
      foregroundColor: Colors.white,
      title: Text(product.title!, style: TextStyle(
        overflow: TextOverflow.ellipsis,
      ),),
    );
  }

  Widget _buildBody() {
    final textStyle = TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
    );
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildImageComponent(),
          SizedBox(height: 10,),
          Text(product.title!, style: textStyle),
          SizedBox(height: 10,),
          Text(product.description!),
          SizedBox(height: 10,),
          Text('Price: \$${product.price!.toStringAsFixed(2)}', style: textStyle),
          SizedBox(height: 10,),
          Text('Rating: ${product.rating!.toStringAsFixed(1)}', style: textStyle),
          SizedBox(height: 10,),
          Text('Category: ${product.category}', style: textStyle),
        ],
      ),
    );
  }

  Widget _buildImageComponent() {
    return SizedBox(
      width: double.infinity,
      height: 250,
      child: Image.network(product.thumbnail!),
    );
  }
}
