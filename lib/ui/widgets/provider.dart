import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class Provider extends StatelessWidget {
  const Provider({ required this.provider, Key? key }) : super(key: key);
  final Map provider;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 75,
      child: Column(
        children: [
            CachedNetworkImage(
              width: 75,
              height: 75,
              placeholder: (context, url) => Shimmer(
                child: Container(
                  width: 75,
                  height: 75,
                  color: const Color.fromARGB(255, 20, 19, 19),
                ),
              ),
              imageUrl: "https://www.themoviedb.org/t/p/original/${provider['logo_path']}",
            ),
          Text(
            provider['provider_name'],
            style: Theme.of(context).textTheme.bodyText1
          ),
        ],
      ),
    );
  }
}