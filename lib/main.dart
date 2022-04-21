import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:where2watchapp/blocs/movie_cubit.dart';
import 'package:where2watchapp/blocs/movie_list_cubit.dart';
import 'package:where2watchapp/models/movie_list.dart';
import 'package:where2watchapp/services/api/movie_request.dart';
import 'package:where2watchapp/services/media/movie_repository.dart';
import 'package:where2watchapp/ui/screens/home_screen.dart';
import 'package:where2watchapp/ui/theme/theme_color.dart';

void main() {
  MovieRequest movieRequest = MovieRequest();
  MovieRepository movieRepository = MovieRepository(movieRequest);
  MovieList movieList = MovieList([], [], []);


  runApp(MultiProvider(
    providers: [
      Provider<ThemeColor>(create: (_) => ThemeColor()),
      Provider<MovieCubit>(create: (_) => MovieCubit(movieRepository)),
      Provider<MovieListCubit>(create: (_) => MovieListCubit(movieRepository,movieList)),
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
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/home': (context) => Home(),
      },
      initialRoute: '/home',
    );
  }
}
