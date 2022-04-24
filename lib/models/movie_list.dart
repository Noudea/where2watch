import 'package:where2watchapp/models/movie.dart';

/// Movie list model
class MovieList {
  List<Movie> popularMovies;
  List<Movie> searchMovies;
  List<Movie> topRatedMovies;
  List<Movie> favoriteMovies;
  bool isLoading;

  //MovieList(this.popularMovies, this.searchMovies, this.topRatedMovies,this.favoriteMovies);

  MovieList({
    this.popularMovies = const [],
    this.searchMovies = const [],
    this.topRatedMovies = const [],
    this.favoriteMovies = const [],
    this.isLoading = true,
  });


}
