import 'package:exercise3/model/ingredient_model.dart';

class Recipe {
  String name;
  String category;
  List<Ingredient> ingredients;

  // Constructor - empty Recipe is not allowed
  Recipe(this.name, this.category, this.ingredients);

  @override
  String toString() {
    return 'Recipe{name: $name, category: $category, ingredients: $ingredients}';
  }
}
