import 'dart:convert';
import 'package:my_network_practice/recipes/data/api/recipe_api.dart';
import 'package:my_network_practice/recipes/data/models/Recipe.dart';
import 'package:http/http.dart' as http;

class RecipeApiImpl extends RecipeApi {
  @override
  Future<List<Recipe>> fetchRecipes() async {
    try {
      final response = await http.get(Uri.parse('https://dummyjson.com/recipes'));
      if(response.statusCode == 200) {
        final recipeData = jsonDecode(response.body);
        final List<dynamic> recipes = recipeData['recipes'];
        return recipes.map((recipe) => Recipe.fromJson(recipe)).toList();
      } else {
        throw Exception('Failed to fetch recipes');
      }
    } catch (e) {
      print('Error occurred while fetching recipes: $e');
      throw Exception('Error occurred while fetching recipes: $e');

    }
  }
  
}