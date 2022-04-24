import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:where2watchapp/blocs/movie_details_cubit.dart';
import 'package:where2watchapp/blocs/movie_list_cubit.dart';
import 'package:where2watchapp/models/movie.dart';
import 'package:where2watchapp/services/converter/converter.dart';
import 'package:where2watchapp/ui/theme/theme_color.dart';
import 'package:where2watchapp/ui/widgets/horizontal_cast_list.dart';
import 'package:where2watchapp/ui/widgets/locations_list.dart';
import 'package:where2watchapp/ui/widgets/video_player.dart';

class MovieDetailsScreen extends StatelessWidget {
  const MovieDetailsScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
  Movie movie = ModalRoute.of(context)!.settings.arguments as Movie;
  Provider.of<MovieDetailsCubit>(context, listen: false).initMovieDetails(movie.id);
  
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: context.read<ThemeColor>().background,
      appBar: AppBar(
        title: const Text('Movie Details'),
        backgroundColor: context.read<ThemeColor>().background,
      ),
      body : 
        BlocBuilder<MovieDetailsCubit, Movie>(
          builder: (context,state) {
            if(state.isLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return Column(
                children: [
                  state.video == '' ? const Text('no video') : VideoPlayer(video: state.video, image: state.image), 
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: ListView(
                        children: [
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
                                Provider.of<MovieListCubit>(context, listen: false).addToFavorite(state);
                              },
                            child: const Text('Add to favorite')
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 40),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(state.title, style: Theme.of(context).textTheme.headline2),
                                Text('Length : ${Converter().convertMinutesToHours(state.length)}',style: Theme.of(context).textTheme.bodyText1),
                                Text(state.description,style : Theme.of(context).textTheme.bodyText1),
                              ],
                            ),
                          ),
                          if(state.locations.isNotEmpty) LocationsList(locations: state.locations),
                          HorizontalCastList(castList : state.cast),
                        ],
                      ),
                    ),
                  )
                ],
              );
            }
          }
        ),
    );
  }
}