import 'package:exercise3/extensions/string_extension_util.dart';
import 'package:exercise3/model/recipe_model.dart';
import 'package:flutter/material.dart';

class RecipeDetailPage extends StatelessWidget {
  const RecipeDetailPage({super.key, required this.recipe});

  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white, // <-- your custom color
        ),
        title: Text(
          'Cuisine: ${recipe.category.capitalizeFirstLetter()}',
          style: const TextStyle(
            color: Color.fromARGB(255, 195, 244, 48),
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 34, 39, 57),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: const Color.fromARGB(255, 28, 32, 48),
        child: Column(
          children: [
            SizedBox(height: 10),
            Text(
              'Selected: ${recipe.name.capitalizeFirstLetter()}',
              style: TextStyle(fontSize: 24, color: Colors.white),
            ),
            SizedBox(height: 10),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2,
              child: ListView.builder(
                itemCount: recipe.ingredients.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: const Color.fromARGB(255, 195, 244, 48),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    margin: const EdgeInsets.all(8),
                    child: Container(
                      width: 50,
                      height: 50,
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        recipe.ingredients[index].name,
                        style: TextStyle(
                          fontSize: 18,
                          color: const Color.fromARGB(255, 34, 39, 57),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
