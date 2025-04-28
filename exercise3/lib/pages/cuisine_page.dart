import 'package:exercise3/components/image_carousel_component.dart';
import 'package:flutter/material.dart';

typedef OnCategorySelected =
    void Function(String cuisineName, BuildContext currContext);

class CuisinePage extends StatelessWidget {
  const CuisinePage({
    super.key,
    required this.categories,
    required this.onCategorySelected,
  });

  final List<String> categories;
  final OnCategorySelected onCategorySelected;

  @override
  Widget build(BuildContext context) {
    return ImageCarousel(categories: categories, onTap: callback);
  }

  void callback(int index, BuildContext currContext) {
    final String selectedCategory = categories[index];
    // callback function to handle selected category for redirect
    onCategorySelected(selectedCategory, currContext);
  }
}
