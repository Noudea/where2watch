import 'package:flutter/cupertino.dart';
import 'package:where2watchapp/models/movie.dart';
import 'package:where2watchapp/ui/widgets/horizontal_movie_card.dart';


class VerticalMovieList extends StatelessWidget {
  const VerticalMovieList({required this.movieList, Key? key})
      : super(key: key);
  final List movieList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: MediaQuery.of(context).size.height,
        child: 
          ListView.builder(
            itemBuilder: (context, index) {
              final Movie movie = movieList[index];
              return HorizontalMovieCard(movie: movie);
            },
            itemCount: movieList.length,
            scrollDirection: Axis.vertical)
          );
  }
}
