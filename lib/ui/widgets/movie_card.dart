import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:where2watchapp/blocs/movie_cubit.dart';
import 'package:where2watchapp/models/movie.dart';
import 'package:where2watchapp/services/media/movie_repository.dart';

class MovieCard extends StatelessWidget {
  MovieCard(this.image,this.title,this.rate, { Key? key }) : super(key: key);
  String image;
  String title;
  num rate;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image(
            height : 180,
            image: NetworkImage(
              'https://image.tmdb.org/t/p/w600_and_h900_bestv2/$image'),
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title
              ),
              Row(
                children: [
                  Image(image: AssetImage('assets/img/Star.png')),
                  Text("$rate/10")
                ],
              )
            ]
          ),
        )
      ]
    );
  }
}