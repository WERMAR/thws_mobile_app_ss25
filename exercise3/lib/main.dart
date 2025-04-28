import 'package:exercise3/model/recipe_model.dart';
import 'package:exercise3/pages/cuisine_page.dart';
import 'package:exercise3/pages/recipes_page.dart';
import 'package:exercise3/service/recipe_loader.dart';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MainAppState();
  }
}

class _MainAppState extends State<MainApp> {
  _MainAppState();

  List<Recipe> currRecipes = [];

  @override
  void initState() {
    super.initState();
    loadRecipes();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(backgroundColor: const Color.fromARGB(255, 28, 32, 48)),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.all(10),
          color: const Color.fromARGB(255, 34, 39, 57),
          child: Column(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Text(
                  "Choose the cuisine...",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: const Color.fromARGB(255, 195, 244, 48),
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2,
                child: CuisinePage(
                  categories:
                      groupBy(
                        currRecipes,
                        (recipe) => recipe.category,
                      ).keys.toList(),
                  onCategorySelected: (cuisineName, currContext) {
                    Navigator.of(currContext).push(
                      MaterialPageRoute(
                        builder:
                            (context) => RecipesPage(
                              recipes:
                                  currRecipes
                                      .where(
                                        (recipe) =>
                                            recipe.category == cuisineName,
                                      )
                                      .toList(),
                              cuisineName: cuisineName,
                            ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void loadRecipes() {
    RecipeLoader.loadRecipes()
        .then((recipes) {
          setState(() {
            currRecipes = recipes;
          });
        })
        .catchError((error) {
          print('Error loading recipes: $error');
        });
  }
}
