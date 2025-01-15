import 'package:flutter/material.dart';
import 'package:my_network_practice/recipes/data/api/recipe_api_impl.dart';
import 'package:my_network_practice/recipes/data/repository/recipe_repository_impl.dart';
import 'package:my_network_practice/recipes/presentation/widgets/recipe_list.dart';

import '../../../shared/result.dart';

class RecipeListScreen extends StatefulWidget {
  const RecipeListScreen({super.key});

  @override
  State<RecipeListScreen> createState() => _RecipeListScreenState();
}

class _RecipeListScreenState extends State<RecipeListScreen> {
  final _recipeRepository = RecipeRepositoryImpl(recipeApi: RecipeApiImpl());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return FutureBuilder(future: _recipeRepository.fetchRecipes(), builder: (context, snapshot) {
      if(snapshot.connectionState == ConnectionState.waiting) {
        return Center(child: CircularProgressIndicator());
      } else if(snapshot.hasData) {
        final result = snapshot.data;
        if(result!.state == ResultState.success) {
          return RecipeList(recipes: result.data!);
        } else {
          return Center(child: Text(result.message!));
        }
      } else {
        return Center(child: Text(snapshot.error.toString()));
      }
    });
  }
}
