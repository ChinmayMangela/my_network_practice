import 'package:my_network_practice/recipes/data/api/recipe_api.dart';
import 'package:my_network_practice/recipes/domain/repository/recipe_repository.dart';

import '../../../shared/result.dart';
import '../models/Recipe.dart';

class RecipeRepositoryImpl extends RecipeRepository {
  final RecipeApi recipeApi;

  RecipeRepositoryImpl({
    required this.recipeApi,
  });

  @override
  Future<Result<List<Recipe>>> fetchRecipes() async {
    try {
      final recipe = await recipeApi.fetchRecipes();
      return Result.success(recipe);
    } catch (e) {
      return Result.failure(e.toString());
    }
  }
}
