import 'package:flutter/material.dart';
import 'package:my_network_practice/products/presentation/screens/products_grid_screen.dart';
import 'package:my_network_practice/users/presentation/screens/user_list.screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: UserListScreen(),
    );
  }
}
