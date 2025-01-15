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
    return Container(
      margin:  const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20)
      ),
      child: Stack(
        children: [
          Image.network(
            recipe.image!,
            fit: BoxFit.fill,
            height: 200,
            width: double.infinity,
          ),
          Positioned(
             bottom: 0,
            child: _buildBottomWidget(context),
          )
        ],
      ),
    );
  }
  
  Widget _buildBottomWidget(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width,
      color: Colors.black.withOpacity(0.6),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(recipe.name!,style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 23
          ),),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildCookingTimeWidget(),
              const SizedBox(width: 10,),
              _buildDifficultyWidget(),
              const SizedBox(width: 10,),
              _buildRatingWidget()
            ],
          )
        ],
      ),
    );
  }
  
  Widget _buildCookingTimeWidget() {
    return _buildIconWithTextWidget(Icons.timer, '${recipe.cookTimeMinutes} mins');
  }

  Widget _buildDifficultyWidget() {
    return _buildIconWithTextWidget(Icons.star, recipe.difficulty!.name);
  }

  Widget _buildRatingWidget() {
    return _buildIconWithTextWidget(Icons.star, '${recipe.rating}');
  }
  
  Widget _buildIconWithTextWidget(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, color: Colors.white,),
        Text(text, style: TextStyle(
            color: Colors.white
        ),),
      ],
    );
  }
}
