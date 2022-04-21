import 'package:flutter/cupertino.dart';
import 'package:where2watchapp/models/movie.dart';
import 'package:where2watchapp/ui/widgets/vertical_movie_card.dart';

class HorizontalMovieList extends StatelessWidget {
  const HorizontalMovieList({required this.movieList, Key? key}) : super(key: key);
  final List movieList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height : 300,
      child : ListView.builder(
        itemBuilder: (context,index) {
          final Movie movie = movieList[index];
          return VerticalMovieCard(image: movie.image, title: movie.title, rate: movie.rate, id: movie.id);
        },
        itemCount: movieList.length,
        scrollDirection: Axis.horizontal
      )
    );
  }
}