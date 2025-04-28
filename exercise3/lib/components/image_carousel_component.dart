import 'package:exercise3/extensions/string_extension_util.dart';
import 'package:flutter/material.dart';

typedef OnCategoryTap = void Function(int index, BuildContext currContext);

class ImageCarousel extends StatelessWidget {
  const ImageCarousel({
    super.key,
    required this.categories,
    required this.onTap,
  });

  final List<String> categories;
  final OnCategoryTap onTap;

  @override
  Widget build(BuildContext context) {
    return CarouselView(
      onTap: (int index) {
        onTap(index, context);
      },
      itemExtent: MediaQuery.of(context).size.width,
      children: List<Widget>.generate(categories.length, (int index) {
        return Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(getAssetLink(categories[index])),
            ),
          ),
          child: Container(
            color: const Color.fromARGB(183, 34, 39, 57),
            child: Center(
              child: Text(
                categories[index].capitalizeFirstLetter(),
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }

  String getAssetLink(String category) {
    switch (category) {
      case 'italian':
        return 'assets/images/Flag_of_Italy.svg.png';
      case 'indian':
        return 'assets/images/Flag_of_India.svg.png';
      case 'turkish':
        return 'assets/images/Flag_of_Turkey.svg.png';
      default:
        throw Exception('Category not found');
    }
  }
}
