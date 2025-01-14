

enum Difficulty {
  easy,
  medium,
  hard,
}

enum MealType {
  breakfast,
  lunch,
  dinner,
  snacks,
  dessert,
  sideDish,
  appetizer,
  beverage,
}

class Recipe {
  final String? name;
  final List<String>? ingredients;
  final List<String>? instructions;
  final String? prepTimeMinutes;
  final String? cookTimeMinutes;
  final int? servings;
  final String? imageUrl;
  final Difficulty? difficulty;
  final int? caloriesPerServing;
  final List<String>? tags;
  final String? image;
  final double? rating;
  final int? reviewCount;
  final List<MealType>? mealType;

  const Recipe({
    required this.name,
    required this.ingredients,
    required this.instructions,
    required this.prepTimeMinutes,
    required this.cookTimeMinutes,
    required this.servings,
    required this.imageUrl,
    required this.difficulty,
    required this.caloriesPerServing,
    required this.tags,
    required this.image,
    required this.rating,
    required this.reviewCount,
    required this.mealType,
  });

  factory Recipe.fromJson(Map<String, dynamic> quotesData) {
    return Recipe(
      name: quotesData['name'],
      ingredients: quotesData['ingredients'],
      instructions: quotesData['instructions'],
      prepTimeMinutes: quotesData['prepTimeMinutes'],
      cookTimeMinutes: quotesData['cookTimeMinutes'],
      servings: quotesData['servings'],
      imageUrl: quotesData['imageUrl'],
      difficulty: quotesData['difficulty'],
      caloriesPerServing: quotesData['caloriesPerServing'],
      tags: quotesData['tags'],
      image: quotesData['image'],
      rating: quotesData['rating'],
      reviewCount: quotesData['reviewCount'],
      mealType: quotesData['mealType'],
    );
  }

}
