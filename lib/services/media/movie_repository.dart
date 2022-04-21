import 'package:where2watchapp/models/movie.dart';
import 'package:where2watchapp/services/api/movie_request.dart';

class MovieRepository {
  final MovieRequest movieRequest;
  MovieRepository(this.movieRequest);

  Future<List<Movie>> getAllMovies(String query) async {
    final Map<String, dynamic> response = await movieRequest.fetchMovies(query);
    final List<Movie> movieList = [];
    final List<dynamic> movies = response['results'];
    
    for (dynamic movie in movies) {
      if(movie['poster_path'] != null) {
        movieList.add(Movie(movie['id'], movie['title'], movie['overview'], movie['poster_path'], movie['vote_average'], []));
      }
    }
    return movieList;
  }

  Future<List<Movie>> getPopularMovies() async {
    final Map<String, dynamic> response = await movieRequest.fetchPopularMovies();
    final List<Movie> movieList = [];
    final List<dynamic> movies = response['results'];
    
    for (dynamic movie in movies) {
      if(movie['poster_path'] != null) {
        movieList.add(Movie(movie['id'], movie['title'], movie['overview'], movie['poster_path'], movie['vote_average'], []));
      }
    }
    return movieList;
  }


  Future<List<Movie>> getTopRatedMovies() async {
    final Map<String, dynamic> response = await movieRequest.fetchTopRatedMovies();
    final List<Movie> movieList = [];
    final List<dynamic> movies = response['results'];

    for (dynamic movie in movies) {
      if (movie['poster_path'] != null) {
        movieList.add(Movie(movie['id'], movie['title'], movie['overview'],
            movie['poster_path'], movie['vote_average'], []));
      }
    }
    return movieList;
  }
}