import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:where2watchapp/blocs/movie_list_cubit.dart';
import 'package:where2watchapp/models/movie_list.dart';
import 'package:where2watchapp/ui/theme/theme_color.dart';
import 'package:where2watchapp/ui/widgets/vertical_movie_list.dart';

class SearchScreenn extends StatelessWidget {
  const SearchScreenn({ Key? key }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    String query = ModalRoute.of(context)!.settings.arguments as String;
    Provider.of<MovieListCubit>(context, listen: true).initSearchPage(query);
    return Scaffold(
      backgroundColor: context.read<ThemeColor>().background,
      appBar: AppBar(
        title: const Text('Movie Details'),
        backgroundColor: context.read<ThemeColor>().background,
      ),
      body: BlocBuilder<MovieListCubit, MovieList>(
          builder: (context, state) {
            if (state.isLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state.searchMovies.isEmpty) {
              return const Center(
                child: Text('No movies found'),
              );
            } else {
                return ListView(children: [
                  VerticalMovieList(movieList: state.searchMovies),
                ]);
            }
          },
        ),
    );
  }
}