import 'package:shared_preferences/shared_preferences.dart';
import 'package:where2watchapp/models/movie.dart';

/// services for shared preferences
class SharedPrefencies {

  SharedPrefencies();
  
  /// add favorite movie to the favorite list in shared preferences
  void addFavoriteMovie(Movie movie) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //get existing movies in shared prefs as string
    List<String> existingMovies = prefs.getStringList('movies') ?? [];
    //convert movie to string
    String jsonmovie = movie.toJson();
    //add new movie to existing movies
    existingMovies.add(jsonmovie);
    //add new movie to sharedPreferencies
    await prefs.setStringList('movies', existingMovies);
  }

  /// retrieve favorite movies from shared preferences
  Future<List<Movie>> getFavoriteMovies() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //get existing movies in shared prefs as string
    final List<String>? json = prefs.getStringList('movies');
    List<Movie> movies = [];
    //convert json string to movie
    
    if (json != null) {
      for (String movie in json) {
        movies.add(Movie.fromJson(movie));
      }
    }

    if(movies.isNotEmpty) {
      return movies;
    } else {
      return [];
    }
  }

}