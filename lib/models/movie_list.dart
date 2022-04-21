import 'package:where2watchapp/models/movie.dart';

class MovieList {
  List<Movie> popularMovies;
  List<Movie> searchMovies;
  List<Movie> topRatedMovies;
  bool isLoading = true;

  MovieList(this.popularMovies, this.searchMovies, this.topRatedMovies);
}
