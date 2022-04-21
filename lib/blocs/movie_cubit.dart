import 'package:bloc/bloc.dart';
import 'package:where2watchapp/models/movie.dart';
import 'package:where2watchapp/services/api/movie_request.dart';
import 'package:where2watchapp/services/media/movie_repository.dart';

class MovieCubit extends Cubit<List<Movie>>{
  MovieCubit(this._movieRep) : super([]);
  final MovieRepository _movieRep;
  //searchmovies
  void searchMovies(String query) async {
    final List<Movie> movies = await _movieRep.getAllMovies(query);
    emit(movies);
  }

  void getPopularMovies() async {
    final List<Movie> movies = await _movieRep.getPopularMovies();
    emit(movies);
  }

}