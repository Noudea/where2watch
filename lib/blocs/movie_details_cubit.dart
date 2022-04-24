import 'package:bloc/bloc.dart';
import 'package:where2watchapp/models/movie.dart';
import 'package:where2watchapp/services/repository/movie_repository.dart';

/// Bloc for movie details, store the current movie, get the movie details from movie repository and serve it to the app
class MovieDetailsCubit extends Cubit<Movie> {
  MovieDetailsCubit(this._movieRep,this.movie) : super(Movie());
  final MovieRepository _movieRep;
  Movie movie;

  /// get movie details from the movie repository
  void getMovieDetails(int movieId) async {
    final Movie movie = await _movieRep.getMovieDetails(movieId); 
    emit(movie);
  }
  
  /// add a movie to the favorite list
  void initMovieDetails(int movieId) async {
    emit(Movie());
    final Movie movie = await _movieRep.getMovieDetails(movieId); 
    movie.isLoading = false;
    emit(movie);
  }
  
}
