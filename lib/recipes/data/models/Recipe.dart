
enum Difficulty {
  easy,
  medium,
  hard,
}

enum MealType {
  breakfast,
  lunch,
  dinner,
  snack,
  dessert,
  appetizer,
  beverage,
}

class Recipe {
  final String? name;
  final List<String> ingredients;
  final List<String> instructions;
  final int? prepTimeMinutes;
  final int? cookTimeMinutes;
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

    // Helper function to parse MealType string to MealType enum
    List<MealType> parseMealType(List<String>? mealTypeString) {
      return mealTypeString!.map((stringMealType) {
        return MealType.values.firstWhere((mealType) {
          return mealType.name.toLowerCase() == stringMealType.toLowerCase();
        }, orElse: () => MealType.appetizer,
        );
      }).toList();
    }

    // Helper function to parse Difficulty string to Difficulty enum
    Difficulty parseDifficulty(String? difficultyString) {
      return Difficulty.values.firstWhere((difficulty) {
        return difficulty.name.toLowerCase() == difficultyString!.toLowerCase();
      }, orElse: () => throw Exception(
        'Invalid difficulty string: $difficultyString'
      ));
    }

    return Recipe(
      name: quotesData['name'],
      // Convert List<dynamic> to List<String> safely
      ingredients: List<String>.from(quotesData['ingredients'] ?? []),
      instructions: List<String>.from(quotesData['instructions'] ?? []),
      prepTimeMinutes: quotesData['prepTimeMinutes'] as int?,
      cookTimeMinutes: quotesData['cookTimeMinutes'] as int?,
      servings: quotesData['servings'] as int?,
      imageUrl: quotesData['imageUrl'],
      difficulty: parseDifficulty(quotesData['difficulty'] as String?),
      caloriesPerServing: quotesData['caloriesPerServing'] as int?,
      tags: quotesData['tags'] != null
          ? List<String>.from(quotesData['tags'])
          : null,
      image: quotesData['image'],
      rating: (quotesData['rating'] is int ? (quotesData['rating'] as int).toDouble() : quotesData['rating']) as double?,
      reviewCount: quotesData['reviewCount'] as int?,
      mealType: quotesData['mealType'] != null
          ? parseMealType(List<String>.from(quotesData['mealType']))
          : null,
    );
  }

}
