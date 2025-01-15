import 'package:flutter/material.dart';
import 'package:my_network_practice/recipes/data/models/Recipe.dart';
import 'package:my_network_practice/recipes/presentation/screens/recipe_detail_screen.dart';
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
        return GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) =>
                      RecipeDetailScreen(recipe: recipes[index]),
                ),
              );
            },
            child: RecipeCard(recipe: recipes[index]));
      },
      itemCount: recipes.length,
    );
  }
}
