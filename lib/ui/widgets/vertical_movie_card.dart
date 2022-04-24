import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
import 'package:where2watchapp/models/movie.dart';

class VerticalMovieCard extends StatelessWidget {
  final Movie movie;
  const VerticalMovieCard({required this.movie,Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/movie_details',arguments: movie);
      },
      child: SizedBox(
        height: 300,
        width: 150,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: CachedNetworkImage(
                    width: 150,
                    height: 200,
                  placeholder: (context, url) => Shimmer(
                    child: Container(
                      width: 150,
                      height: 200,
                      color: const Color.fromARGB(255, 20, 19, 19),
                    ),
                  ),
                  imageUrl: 'https://image.tmdb.org/t/p/w600_and_h900_bestv2/${movie.image}',
                ),
              ),
              Text(
                movie.title,
                style: Theme.of(context).textTheme.headline4,
              ),
              Row(
                children: [
                  const Image(image: AssetImage('assets/img/Star.png')),
                  Text(
                    "${movie.rate}/10",
                    style : Theme.of(context).textTheme.bodyText2,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}