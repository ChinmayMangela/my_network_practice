import 'package:flutter/material.dart';
import 'package:my_network_practice/recipes/data/models/Recipe.dart';

class RecipeDetailScreen extends StatelessWidget {
  const RecipeDetailScreen({
    super.key,
    required this.recipe,
  });

  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.black,
      foregroundColor: Colors.white,
      title: Text(
        recipe.name!,
        style: TextStyle(
          overflow: TextOverflow.ellipsis
        ),
      ),
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildRecipeImage(),
            _buildIngredientsComponent(),
            const SizedBox(height: 30),
            _buildInstructionsComponent(),
          ],
        ),
      ),
    );
  }

  Widget _buildRecipeImage() {
    return SizedBox(
      width: double.infinity,
      height: 350,
      child: Image.network(
        recipe.image!,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildIngredientsComponent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Ingredients',
          style: TextStyle(
            color: Colors.green.shade900,
            fontSize: 30,
          ),
        ),
        ...recipe.ingredients.map(
          (ingredient) {
            return Text(
              ingredient,
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildInstructionsComponent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Instructions',
          style: TextStyle(
            color: Colors.green.shade900,
            fontSize: 30,
          ),
        ),
        ...recipe.instructions.map(
          (ingredient) {
            return Text(
              ingredient,
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
              ),
            );
          },
        ),
      ],
    );
  }
}
