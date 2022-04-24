import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class ActorCard extends StatelessWidget {
  const ActorCard({required this.actor, Key? key }) : super(key: key);
  final Map actor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      width: 100,
      child: Column(
        children: [
          actor['profile_path'] != null ?
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: CachedNetworkImage(
              width: 100,
              height: 150,
              placeholder: (context, url) => Shimmer(
                child: Container(
                  width: 100,
                  height: 150,
                  color: const Color.fromARGB(255, 20, 19, 19),
                ),
              ),
              imageUrl: "https://image.tmdb.org/t/p/w600_and_h900_bestv2/${actor['profile_path']}",
            ),
          ): Container(
            width: 100,
            height: 150,
            color: const Color.fromARGB(255, 20, 19, 19),
          ),
          Text(actor['name'],style: Theme.of(context).textTheme.bodyText1),
        ]
      ),
    );
  }
}