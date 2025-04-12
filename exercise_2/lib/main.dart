import 'package:exercise_2/components/image_carousel.component.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const BaseApp());
}

class BaseApp extends StatelessWidget {
  const BaseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Image Carousel',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 255, 153, 0),
        ),
        useMaterial3: true,
      ),
      home: const MainApp(),
    );
  }
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<StatefulWidget> createState() => _MainAppStateful();
}

class _MainAppStateful extends State<MainApp> {
  bool useNetworkImages = true;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            tooltip: 'Enable Network Images',
            onPressed:
                () => setState(() {
                  useNetworkImages = !useNetworkImages;
                }),
            icon: Icon(
              Icons.network_check,
              size: 30,
              color:
                  useNetworkImages
                      ? Theme.of(context).colorScheme.tertiary
                      : Colors.white,
            ),
          ),
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.all(20),
          child: ImageCarousel(useNetworkImages: useNetworkImages),
        ),
      ),
    );
  }
}
