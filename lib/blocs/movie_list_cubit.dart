import 'package:bloc/bloc.dart';
import 'package:where2watchapp/models/movie.dart';
import 'package:where2watchapp/models/movie_list.dart';
import 'package:where2watchapp/services/repository/movie_repository.dart';

/// Bloc for movie list, get the movie list from movie repository and serve it to the app
class MovieListCubit extends Cubit<MovieList>{
  MovieListCubit(this._movieRep,this.movieList) : super(MovieList());
  final MovieRepository _movieRep;
  MovieList movieList;
  
  /// init the home_screen
  void initHomePage() async {
    movieList.popularMovies = await _movieRep.getPopularMovies();
    movieList.topRatedMovies = await _movieRep.getTopRatedMovies();
    movieList.favoriteMovies = await _movieRep.getFavoriteMovies();
    movieList.isLoading = false;
    emit(movieList);
  }
  
  /// init the search_screen
  void initSearchPage(String query) async {
    movieList.popularMovies = await _movieRep.getPopularMovies();
    movieList.topRatedMovies = await _movieRep.getTopRatedMovies();
    movieList.favoriteMovies = await _movieRep.getFavoriteMovies();
    movieList.searchMovies = await _movieRep.getAllMovies(query);
    MovieList _movieList = MovieList();
    _movieList.favoriteMovies = movieList.favoriteMovies;
    _movieList.popularMovies = movieList.popularMovies;
    _movieList.topRatedMovies = movieList.topRatedMovies;
    _movieList.searchMovies = movieList.searchMovies;
    _movieList.searchMovies = movieList.searchMovies;
    _movieList.isLoading = false;
    emit(_movieList);
  }
  
  /// add a movie to the favorite list
  void addToFavorite(Movie movie) async {
    _movieRep.addFavoriteMovie(movie);
    movieList.favoriteMovies = await _movieRep.getFavoriteMovies();
    MovieList _movieList = MovieList();
    _movieList.favoriteMovies = movieList.favoriteMovies;
    _movieList.popularMovies = movieList.popularMovies;
    _movieList.topRatedMovies = movieList.topRatedMovies;
    _movieList.searchMovies = movieList.searchMovies;
    _movieList.isLoading = false;
    emit(_movieList);
  }

}