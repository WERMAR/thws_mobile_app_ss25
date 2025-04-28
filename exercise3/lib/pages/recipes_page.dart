import 'package:exercise3/model/recipe_model.dart';
import 'package:exercise3/extensions/string_extension_util.dart';
import 'package:exercise3/pages/recipe_detail_page.dart';
import 'package:flutter/material.dart';

class RecipesPage extends StatelessWidget {
  const RecipesPage({
    super.key,
    required this.recipes,
    required this.cuisineName,
  });

  final List<Recipe> recipes;
  final String cuisineName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white, // <-- your custom color
        ),
        title: Text(
          'Cuisine: ${cuisineName.capitalizeFirstLetter()}',
          style: const TextStyle(
            color: Color.fromARGB(255, 195, 244, 48),
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 34, 39, 57),
      ),
      body: Container(
        color: const Color.fromARGB(255, 28, 32, 48),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: ListView.builder(
          itemCount: 3,
          itemBuilder: (context, index) {
            return Card(
              color: const Color.fromARGB(255, 34, 39, 57),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              margin: const EdgeInsets.all(8),
              child: Material(
                color: const Color.fromARGB(255, 28, 32, 48),
                child: InkWell(
                  borderRadius: BorderRadius.circular(10),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder:
                            (builder) =>
                                RecipeDetailPage(recipe: recipes[index]),
                      ),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          recipes[index].name,
                          style: TextStyle(fontSize: 22, color: Colors.white),
                        ),
                        Icon(Icons.arrow_forward_ios, color: Colors.white),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
