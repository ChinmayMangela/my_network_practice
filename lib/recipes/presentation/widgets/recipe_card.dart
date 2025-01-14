import 'package:flutter/material.dart';
import 'package:my_network_practice/recipes/data/models/Recipe.dart';

class RecipeCard extends StatelessWidget {
  const RecipeCard({
    super.key,
    required this.recipe,
  });

  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Stack(
        children: [Image.network(recipe.image!, fit: BoxFit.fill, height: 200, width: double.infinity,)],
      ),
    );
  }
}
