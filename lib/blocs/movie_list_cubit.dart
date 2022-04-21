import 'package:bloc/bloc.dart';
import 'package:where2watchapp/models/movie_list.dart';
import 'package:where2watchapp/services/media/movie_repository.dart';

class MovieListCubit extends Cubit<MovieList>{
  MovieListCubit(this._movieRep,this.movieList) : super(MovieList([], [], []));
  final MovieRepository _movieRep;
  MovieList movieList;
  //searchmovies
  void searchMovies(String query) async {
    movieList.searchMovies = await _movieRep.getAllMovies(query);
    emit(movieList);
  }

  void getPopularMovies() async {
    //final List movieList.popularMovies = await _movieRep.getPopularMovies();
    movieList.popularMovies = await _movieRep.getPopularMovies();
    emit(movieList);
  }

  void getTopRatedMovies() async {
    movieList.topRatedMovies = await _movieRep.getTopRatedMovies();
    emit(movieList);
  }

  void initHomePage() async {
    movieList.popularMovies = await _movieRep.getPopularMovies();
    movieList.topRatedMovies = await _movieRep.getTopRatedMovies();
    movieList.isLoading = false;
    emit(movieList);
  }
}