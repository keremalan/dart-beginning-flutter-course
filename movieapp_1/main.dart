import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MoviesApp());

class MoviesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MoviesListing(),
    );
  }
}

class MoviesProvider {

  static final String imagePathPrefix = 'https://image.tmdb.org/t/p/w500';
  static final apiKey = "90dc725874e206689574e5fd4d2d5ff0";

  static Future<Map> getJson() async {
  final apiEndPoint = "http://api.themoviedb.org/3/discover/movie?api_key=${apiKey}&sort_by=popularity.desc";
  final apiResponse = await http.get(Uri.parse(apiEndPoint));
  return json.decode(apiResponse.body);
  }
}

class MoviesListing extends StatefulWidget {
  @override
  _MoviesListingState createState() => _MoviesListingState();
}

class _MoviesListingState extends State<MoviesListing> {
  var movies;

  fetchMovies() async{
  var data = await MoviesProvider.getJson();
  setState((){
    movies = data['results'];
  });
}

  @override
  Widget build(BuildContext context) {
    fetchMovies();
    return Scaffold(
      body: ListView.builder(
        itemCount: movies == null ? 0 : movies.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(movies[index]["title"]),
          );
        },
      ),
    );
}
}