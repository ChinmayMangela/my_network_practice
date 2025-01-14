

import 'package:my_network_practice/recipes/data/models/Recipe.dart';

import '../../../shared/result.dart';

abstract class RecipeRepository {

  Future<Result<List<Recipe>>> fetchRecipes();
}