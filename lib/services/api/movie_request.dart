import 'dart:convert';
import 'package:http/http.dart';

/// class to interact with the movie api
class MovieRequest {

  /// get all movies from the API with the given query
  Future<Map<String, dynamic>> fetchMovies(String query) async {
    if(query.isEmpty) {
      return {};
    }
    final Response response = await get(Uri.parse('https://api.themoviedb.org/3/search/movie?api_key=90988c3bb6398775312ca9b70d0e4c39&query=$query'));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load movies');
    }
  }

  /// get popular movies from api
  Future <Map<String, dynamic>> fetchPopularMovies() async {
    final Response response = await get(Uri.parse('https://api.themoviedb.org/3/movie/popular?api_key=90988c3bb6398775312ca9b70d0e4c39&page=1'));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load movies');
    }
  }

  /// get top rated movies from api
  Future <Map<String,dynamic>> fetchTopRatedMovies() async {
    final Response response = await get(Uri.parse('https://api.themoviedb.org/3/movie/top_rated?api_key=90988c3bb6398775312ca9b70d0e4c39&page=1'));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load movies');
    }
  }

  /// get movie details with movieId from api
  Future <Map<String,dynamic>> fetchMovieDetails(movieId) async {
    final Response response = await get(Uri.parse('https://api.themoviedb.org/3/movie/$movieId?api_key=90988c3bb6398775312ca9b70d0e4c39&append_to_response=videos,credits'));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load movies');
    }
  }

  /// get movie locations with movieId from api, locations = providers(netflix, amazon, etc)
  Future <Map<String,dynamic>> fetchMovieLocations(movieId) async {
    final Response response = await get(Uri.parse('https://api.themoviedb.org/3/movie/$movieId/watch/providers?api_key=90988c3bb6398775312ca9b70d0e4c39'));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load movies');
    }
  }
  
}