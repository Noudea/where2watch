

import 'dart:convert';

import 'package:http/http.dart';

class MovieRequest {
  Future<Map<String, dynamic>> fetchMovies(String query) async {
    final Response response = await get(Uri.parse('https://api.themoviedb.org/3/search/movie?api_key=90988c3bb6398775312ca9b70d0e4c39&query=$query'));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load movies');
    }
  }

  Future <Map<String, dynamic>> fetchPopularMovies() async {
    final Response response = await get(Uri.parse('https://api.themoviedb.org/3/movie/popular?api_key=90988c3bb6398775312ca9b70d0e4c39&page=1'));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load movies');
    }
  }

  Future <Map<String,dynamic>> fetchTopRatedMovies() async {
    final Response response = await get(Uri.parse('https://api.themoviedb.org/3/movie/top_rated?api_key=90988c3bb6398775312ca9b70d0e4c39&page=1'));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load movies');
    }
  }

  // Future <Map<String,dynamic>> fetchMovieLocationsById(int id) async {

  // }
}