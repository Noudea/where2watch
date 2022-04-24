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
    MovieList _movieList = MovieList(
      favoriteMovies: await _movieRep.getPopularMovies(),
      popularMovies: await _movieRep.getTopRatedMovies(),
      topRatedMovies: await _movieRep.getFavoriteMovies(),
      searchMovies: await _movieRep.getAllMovies(query),
      isLoading: false,
    );
    emit(_movieList);
  }
  
  /// add a movie to the favorite list
  void addToFavorite(Movie movie) async {
    _movieRep.addFavoriteMovie(movie);
    MovieList _movieList = MovieList(
      favoriteMovies: await _movieRep.getFavoriteMovies(),
      popularMovies: movieList.popularMovies,
      topRatedMovies: movieList.topRatedMovies,
      searchMovies: movieList.searchMovies,
      isLoading: false,
    );
    emit(_movieList);
  }

}