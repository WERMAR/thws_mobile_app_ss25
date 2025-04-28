import 'dart:convert';

import 'package:exercise3/model/ingredient_model.dart';
import 'package:exercise3/model/recipe_model.dart';
import 'package:flutter/services.dart';

class RecipeLoader {
  /// Loads recipes from a file or a database.
  /// This method should handle the file reading or database querying.
  /// It should also parse the data into a list of Recipe objects.
  /// If the data is invalid, it should throw an exception or return an error.
  static Future<List<Recipe>> loadRecipes() async {
    // load recipe.json from assets
    var recipeData = await rootBundle.loadString('assets/data/recepies.json');
    // decode json
    var parsedJson = jsonDecode(recipeData);
    return parsedJson['recipes'].map<Recipe>((json) {
      var recipe = Recipe(
        json['name'],
        json['category'],
        (json['ingredients'] as List)
            .map((ingredient) => Ingredient(ingredient))
            .toList(),
      );
      return recipe;
    }).toList();
  }
}
