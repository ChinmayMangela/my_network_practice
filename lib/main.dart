import 'package:flutter/material.dart';
import 'package:my_network_practice/products/presentation/screens/products_list_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ProductsGridScreen(),
    );
  }
}
