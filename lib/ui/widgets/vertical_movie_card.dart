import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class VerticalMovieCard extends StatelessWidget {
  VerticalMovieCard({required this.image,required this.title,required this.rate,required this.id,Key? key }) : super(key: key);
  String image;
  String title;
  num rate;
  int id;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print(id);
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
                      color: Color.fromARGB(255, 20, 19, 19),
                    ),
                  ),
                  imageUrl: 'https://image.tmdb.org/t/p/w600_and_h900_bestv2/$image',
                ),
              ),
              Text(
                title,
              ),
              Row(
                children: [
                  Image(image: AssetImage('assets/img/Star.png')),
                  Text("$rate/10")
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}