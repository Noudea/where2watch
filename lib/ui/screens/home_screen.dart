import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:where2watchapp/blocs/movie_list_cubit.dart';
import 'package:where2watchapp/models/movie_list.dart';
import 'package:where2watchapp/ui/theme/theme_color.dart';
import 'package:where2watchapp/ui/widgets/horizontal_movie_list.dart';

class Home extends StatelessWidget {
  Home({ Key? key }) : super(key: key);
  final TextEditingController _searchInputController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
  Provider.of<MovieListCubit>(context, listen: false).initHomePage();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: context.read<ThemeColor>().background,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 20),
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
              Padding(
                padding: const EdgeInsets.only(left: 60,right: 60,bottom: 20),
                child: Column(
                  children: [
                    SizedBox(
                      height: 38,
                      child:
                        TextFormField(
                          controller: _searchInputController,
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
                        Navigator.pushNamed(context, '/search_movies',
                              arguments: _searchInputController.text);
                      },
                      child: const Text('Search')
                    )
                  ],
                ),
              ),
              Expanded(
                child : BlocBuilder<MovieListCubit, MovieList>(
                  builder: (context, state) {
                    if(state.isLoading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      return ListView(
                        children: [
                          Text('Popular',
                            style: Theme.of(context).textTheme.headline2),
                          HorizontalMovieList( movieList : state.popularMovies),
                          Text('Top Rated',
                            style: Theme.of(context).textTheme.headline2),
                          HorizontalMovieList( movieList : state.topRatedMovies),
                          Text('Favorite',
                            style: Theme.of(context).textTheme.headline2),
                          HorizontalMovieList( movieList : state.favoriteMovies),
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