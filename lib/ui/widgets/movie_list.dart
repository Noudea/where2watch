import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:where2watchapp/blocs/movie_cubit.dart';
import 'package:where2watchapp/models/movie.dart';
import 'package:where2watchapp/ui/widgets/movie_card.dart';

class MovieList extends StatelessWidget {
  const MovieList({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height : 400,
      child : BlocBuilder<MovieCubit, List<Movie>>(
        builder : (context,state) {
          if(state.isEmpty) {
            return Center(
              child : Text('No movies found')
            );
          } else {
            return ListView.builder(
              itemBuilder: (context,index) {
                final Movie movie = state[index];
                return MovieCard(movie.image,movie.title,movie.rate);
              },
              itemCount: state.length,
              // scrollDirection: Axis.horizontal
            );
          }
        }
      )
    );
  }
}