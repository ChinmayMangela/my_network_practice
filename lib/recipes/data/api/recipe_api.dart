
import '../models/Recipe.dart';

abstract class RecipeApi {

  Future<List<Recipe>> fetchRecipes();
}