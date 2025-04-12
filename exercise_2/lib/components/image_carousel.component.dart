import 'package:exercise_2/enums/click_type.enum.dart';
import 'package:flutter/material.dart';

class ImageCarousel extends StatefulWidget {
  bool useNetworkImages = false;

  ImageCarousel({super.key, this.useNetworkImages = false});

  @override
  State<StatefulWidget> createState() => _ImageCarouselStateful();
}

class _ImageCarouselStateful extends State<ImageCarousel> {
  _ImageCarouselStateful();

  int currentLocalImageIndex = 0;
  int currentNetworkImageIndex = 0;

  final List<String> localImages = [
    "assets/images/MW0_5877.jpg",
    "assets/images/MW0_5921.jpg",
    "assets/images/MW0_5924.jpg",
  ];

  final List<String> networkImages = [
    "https://cdn.pixabay.com/photo/2024/10/16/09/14/alps-9124288_1280.jpg",
    "https://cdn.pixabay.com/photo/2025/03/31/08/17/penguin-9504250_1280.jpg",
    "https://cdn.pixabay.com/photo/2025/03/29/10/59/ryoan-ji-9500830_1280.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height / 1.5,
          decoration: BoxDecoration(
            //border: Border.all(color: Colors.black, width: 4),
            boxShadow: [
              BoxShadow(
                color: const Color.fromARGB(255, 110, 110, 110),
                blurRadius: 20,
                spreadRadius: 2,
                offset: Offset(5, 4),
              ),
            ],
            color: const Color.fromARGB(255, 241, 241, 241),
            borderRadius: BorderRadius.circular(20),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child:
                widget.useNetworkImages
                    ? FadeInImage.assetNetwork(
                      placeholder: 'assets/images/loading.gif',
                      fit: BoxFit.fill,
                      image: networkImages[currentNetworkImageIndex],
                    )
                    : Image.asset(
                      localImages[currentLocalImageIndex],
                      fit: BoxFit.fill,
                    ),
          ),
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              width: 150,
              height: 50,
              child: FloatingActionButton(
                onPressed: () {
                  selectNewImage(ClickType.left);
                },
                backgroundColor: Theme.of(context).colorScheme.secondary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Icon(Icons.arrow_back, size: 30, color: Colors.white),
              ),
            ),
            SizedBox(
              width: 150,
              height: 50,
              child: FloatingActionButton(
                onPressed: () {
                  selectNewImage(ClickType.right);
                },
                backgroundColor: Theme.of(context).colorScheme.secondary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Icon(Icons.arrow_forward, size: 30, color: Colors.white),
              ),
            ),
          ],
        ),
      ],
    );
  }

  void selectNewImage(final ClickType clickType) {
    switch (clickType) {
      case ClickType.left:
        setState(() {
          if (widget.useNetworkImages) {
            int tempIndex = currentNetworkImageIndex - 1;
            currentNetworkImageIndex =
                tempIndex < 0 ? networkImages.length - 1 : tempIndex;
          } else {
            int tempIndex = currentLocalImageIndex - 1;
            currentLocalImageIndex =
                tempIndex < 0 ? localImages.length - 1 : tempIndex;
          }
        });
      case ClickType.right:
        setState(() {
          if (widget.useNetworkImages) {
            int tempIndex = currentNetworkImageIndex + 1;
            currentNetworkImageIndex =
                tempIndex >= networkImages.length ? 0 : tempIndex;
            (currentNetworkImageIndex + 1) % networkImages.length;
          } else {
            int tempIndex = currentLocalImageIndex + 1;
            currentLocalImageIndex =
                tempIndex >= localImages.length ? 0 : tempIndex;
          }
        });
    }
  }
}
