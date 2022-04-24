import 'package:where2watchapp/models/movie.dart';
import 'package:where2watchapp/services/api/movie_request.dart';
import 'package:where2watchapp/services/shared_preferencies/shared_preferencies.dart';

/// This class is responsible for the movie repository and communiation with the api request services
class MovieRepository {
  final MovieRequest movieRequest;
  MovieRepository(this.movieRequest);

  /// get all movies from the API with the given query
  Future<List<Movie>> getAllMovies(String query) async {
    final Map<String, dynamic> response = await movieRequest.fetchMovies(query);
    final List<Movie> movieList = [];
    final List<dynamic> movies = response['results'] ?? [];
    for (dynamic movie in movies) {
      if(movie['poster_path'] != null) {
        movieList.add(Movie(id : movie['id'],title: movie['title'],description: movie['overview'],image: movie['poster_path'],rate: movie['vote_average']));
      }
    }
    return movieList;
  }

  /// get popular movies from api
  Future<List<Movie>> getPopularMovies() async {
    final Map<String, dynamic> response = await movieRequest.fetchPopularMovies();
    final List<Movie> movieList = [];
    final List<dynamic> movies = response['results'];
    
    for (dynamic movie in movies) {
      if(movie['poster_path'] != null) {
        movieList.add(Movie(id: movie['id'],title : movie['title'],description: movie['overview'],image: movie['poster_path'],rate: movie['vote_average']));
      }
    }
    return movieList;
  }

  /// get top rated movies from api
  Future<List<Movie>> getTopRatedMovies() async {
    final Map<String, dynamic> response = await movieRequest.fetchTopRatedMovies();
    final List<Movie> movieList = [];
    final List<dynamic> movies = response['results'];

    for (dynamic movie in movies) {
      if (movie['poster_path'] != null) {
        movieList.add(Movie(id: movie['id'],title: movie['title'],description: movie['overview'],image: movie['poster_path'],rate: movie['vote_average']));
      }
    }
    return movieList;
  }

  ///get movie details with id from api
  Future<Movie> getMovieDetails(int movieId) async {
    final Map<String, dynamic> movieDetails = await movieRequest.fetchMovieDetails(movieId);
    final Map<String,dynamic> movieLocations = await movieRequest.fetchMovieLocations(movieId);
    final Movie movie = Movie(
      id: movieDetails['id'],
      title: movieDetails['title'],
      description: movieDetails['overview'],
      image: movieDetails['poster_path'],
      locations: movieLocations['results']['FR'] ?? {},
      rate: movieDetails['vote_average'],
      video: movieDetails['videos']['results'].isNotEmpty ? movieDetails['videos']['results'][0]['key'] : '',
      length: movieDetails['runtime'],
      cast: movieDetails['credits']['cast'],
    );
    return movie;
  }

  /// get favorite movies from shared preferences
  Future<List<Movie>> getFavoriteMovies() async {
    final List<Movie> favoriteMovies = await SharedPrefencies().getFavoriteMovies();
    return favoriteMovies;
  }
  
  /// add movie to favorite in shared preferences
  void addFavoriteMovie(Movie movie) {
    SharedPrefencies().addFavoriteMovie(movie);
  }

}