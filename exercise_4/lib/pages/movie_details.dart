import 'package:exercise_4/main.dart';
import 'package:flutter/material.dart';

class MovieDetailsScreen extends StatelessWidget {
  final Movie movie;

  const MovieDetailsScreen({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(movie.title)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Directed by: ${movie.director}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Image.network(
              movie.imageURLs.elementAt(1),
              errorBuilder:
                  (context, error, stackTrace) => Image.asset(
                    'assets/images/placeholder.png',
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
            ),
            SizedBox(height: 8),
            Text(movie.plot, style: TextStyle(fontSize: 16)),
            SizedBox(height: 8),
            Image.network(movie.imageURLs.elementAt(2)),
            SizedBox(height: 8),
            Text(movie.genre, style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
