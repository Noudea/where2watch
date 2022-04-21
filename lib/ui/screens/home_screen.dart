import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:where2watchapp/blocs/movie_cubit.dart';
import 'package:where2watchapp/blocs/movie_list_cubit.dart';
import 'package:where2watchapp/models/movie.dart';
import 'package:where2watchapp/models/movie_list.dart';
import 'package:where2watchapp/services/api/movie_request.dart';
import 'package:where2watchapp/ui/theme/theme_color.dart';
import 'package:where2watchapp/ui/widgets/horizontal_movie_list.dart';
import 'package:where2watchapp/ui/widgets/movie_card.dart';
import 'package:where2watchapp/ui/widgets/vertical_movie_card.dart';

class Home extends StatelessWidget {
  Home({ Key? key }) : super(key: key);
  final TextEditingController _searchInputController = TextEditingController();
  final MovieRequest _movieRequest = MovieRequest();
  
  @override
  Widget build(BuildContext context) {
  Provider.of<MovieListCubit>(context, listen: false).initHomePage();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: context.read<ThemeColor>().background,
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 20, bottom: 40,left : 60,right : 60),
                child: Column(
                  children: <Widget>[
                    Text('Where2Watch',
                      style : TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: context.read<ThemeColor>().accent,
                        fontFamily: 'NetflixSans',
                        letterSpacing: -2.5
                      )
                    ),
                    Text('Find where to watch your',
                      style : TextStyle(
                        fontSize: 16,
                        fontFamily: 'NetflixSans',
                        color: context.read<ThemeColor>().text,
                        fontWeight: FontWeight.w300
                      )
                    ),
                    Text('movies and series',
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'NetflixSans',
                        color: context.read<ThemeColor>().text,
                        fontWeight: FontWeight.w300
                      )
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding : EdgeInsets.symmetric(horizontal: 60),
                    child: Container(
                      height : 38,
                      child: TextFormField(
                        controller: _searchInputController,
                        // validator: (String? value) {
                        //   if (value == null || value.isEmpty) {
                        //     return 'Le nom doit être renseigné';
                        //   } else {
                        //     return null;
                        //   }
                        // },
                        decoration: InputDecoration(
                            labelText: "Search",
                            filled: true,
                            floatingLabelBehavior:
                                FloatingLabelBehavior.never,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                              )
                          ),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    style: TextButton.styleFrom(
                      backgroundColor: context.read<ThemeColor>().accent,
                      textStyle: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: context.read<ThemeColor>().accent,
                        fontFamily: 'NetflixSans'
                      )
                    ),
                      onPressed: () {
                        //_movieRequest.fetchMovies(_searchInputController.text).then((value) => print(value));
                        //Provider.of<MovieCubit>(context, listen: false).searchMovies(_searchInputController.text);
                        Provider.of<MovieCubit>(context, listen: false)
                            .searchMovies("spiderman");
                      },
                      child: const Text('Search'))
                ],
              ),
              Expanded(
                child : BlocBuilder<MovieListCubit, MovieList>(
                  builder: (context, state) {
                    print(state.isLoading);
                    if(state.isLoading) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      return ListView(
                        children: [
                          HorizontalMovieList( movieList : state.popularMovies),
                          HorizontalMovieList( movieList : state.topRatedMovies)
                        ]
                      );
                    }
                }),
              )
            ],
          ),
        ),
      )
    );
  }
}