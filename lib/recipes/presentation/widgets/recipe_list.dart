import 'package:flutter/material.dart';
import 'package:my_network_practice/recipes/data/models/Recipe.dart';
import 'package:my_network_practice/recipes/presentation/widgets/recipe_card.dart';

class RecipeList extends StatelessWidget {
  const RecipeList({
    super.key,
    required this.recipes,
  });

  final List<Recipe> recipes;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return RecipeCard(recipe: recipes[index]);
      },
      itemCount: recipes.length,
    );
  }
}
