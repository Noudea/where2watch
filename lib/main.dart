import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:where2watchapp/blocs/movie_details_cubit.dart';
import 'package:where2watchapp/blocs/movie_list_cubit.dart';
import 'package:where2watchapp/models/movie.dart';
import 'package:where2watchapp/models/movie_list.dart';
import 'package:where2watchapp/services/api/movie_request.dart';
import 'package:where2watchapp/services/repository/movie_repository.dart';
import 'package:where2watchapp/ui/screens/home_screen.dart';
import 'package:where2watchapp/ui/screens/movie_details._screen.dart';
import 'package:where2watchapp/ui/screens/search_screen.dart';
import 'package:where2watchapp/ui/theme/theme_color.dart';

void main() {
  /// base init
  MovieRequest movieRequest = MovieRequest();
  MovieRepository movieRepository = MovieRepository(movieRequest);
  MovieList movieList = MovieList();
  Movie movie = Movie();

  runApp(MultiProvider(
    providers: [
      Provider<ThemeColor>(create: (_) => ThemeColor()),
      Provider<MovieListCubit>(create: (_) => MovieListCubit(movieRepository,movieList)),
      Provider<MovieDetailsCubit>(create: (_) => MovieDetailsCubit(movieRepository,movie)),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: TextTheme(
          headline1: const TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          headline2: TextStyle(
            fontSize: 32.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'NetflixSans',
            color: context.read<ThemeColor>().accent
          ),
          headline3: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            fontFamily: 'NetflixSans',
            color: context.read<ThemeColor>().text
          ),
          headline4: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            fontFamily: 'NetflixSans',
            color: context.read<ThemeColor>().text
          ),
          bodyText1: TextStyle(
            fontSize: 16,
            fontFamily: 'NetflixSans',
            color: context.read<ThemeColor>().text
          ),
          bodyText2: TextStyle(
            fontSize: 12,
            fontFamily: 'NetflixSans',
            color: context.read<ThemeColor>().text
          )
        ),
      ),
      routes: {
        '/home': (context) => Home(),
        '/movie_details': (context) => const MovieDetailsScreen(),
        '/search_movies': (context) => const SearchScreenn(),
      },
      initialRoute: '/home',
    );
  }
}
