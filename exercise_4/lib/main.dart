import 'dart:convert';

import 'package:exercise_4/pages/movie_details.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MyScreen(),
    );
  }
}

class MyScreen extends StatelessWidget {
  const MyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: MyHttpWidget());
  }
}

class MyHttpWidget extends StatefulWidget {
  final movieUri =
      'https://670ef2d6-dbdd-454c-b4d7-6960afb18cc2.mock.pstmn.io/movies';
  const MyHttpWidget({super.key});

  @override
  State<MyHttpWidget> createState() => _MyHttpWidgetState();
}

class _MyHttpWidgetState extends State<MyHttpWidget> {
  List<Movie> movies = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadMovies().then((m) {
      setState(() {
        isLoading = false;
        movies = m;
      });
    });
  }

  Future<List<Movie>> _loadMovies() async {
    await Future.delayed(const Duration(seconds: 3));
    final response = await http.get(Uri.parse(widget.movieUri));
    var returnValue = <Movie>[];

    if (response.statusCode == 200) {
      final movies = jsonDecode(response.body) as List;
      returnValue = List.generate(
        movies.length,
        (index) => Movie.fromJson(movies[index] as Map<String, dynamic>),
      );
    }
    return returnValue;
  }

  @override
  Widget build(BuildContext context) {
    if (movies.isEmpty) {
      return const Center(child: Text("No movies found"));
    }

    return ListView.builder(
      itemCount: movies.length,
      prototypeItem: MovieListItem(movie: movies.first),
      itemBuilder: (context, index) {
        return MovieListItem(movie: movies[index]);
      },
    );
  }
}

class Movie {
  final String title;
  final String director;
  final List<String> imageURLs;
  final String plot;
  final String genre;

  Movie({
    required this.title,
    required this.director,
    required this.imageURLs,
    required this.plot,
    required this.genre,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      title: json['Title'],
      director: json['Director'],
      imageURLs: List<String>.from(json['Images']),
      plot: json['Plot'],
      genre: json['Genre'],
    );
  }
}

class MovieListItem extends StatelessWidget {
  final Movie movie;

  const MovieListItem({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 206, 206, 206),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(90),
            blurRadius: 10,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MovieDetailsScreen(movie: movie),
              ),
            );
          },
          child: Padding(
            padding: EdgeInsets.all(5),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.transparent,
                  child: ClipOval(
                    child: FadeInImage(
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                      placeholder: AssetImage('assets/images/placeholder.png'),
                      image:
                          movie.imageURLs.isNotEmpty
                              ? NetworkImage(movie.imageURLs.first)
                              : AssetImage('assets/images/placeholder.png'),
                      imageErrorBuilder: (context, error, stackTrace) {
                        return Image.asset(
                          'assets/images/placeholder.png',
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [Text(movie.title), Text(movie.director)],
                  ),
                ),
                Icon(Icons.arrow_forward_ios),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
