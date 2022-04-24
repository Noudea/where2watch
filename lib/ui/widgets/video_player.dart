import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlayer extends StatefulWidget {
  const VideoPlayer({required this.video,required this.image ,Key? key }) : super(key: key);
  final String video;
  final String image;

  @override
  State<VideoPlayer> createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> {
  late YoutubePlayerController _controller;
  @override
  void initState() {
    _controller = YoutubePlayerController(
      initialVideoId: widget.video,
      flags: const YoutubePlayerFlags(
          mute: false,
          autoPlay: false,
          disableDragSeek: true,
          loop: false,
          enableCaption: false),
    );

    super.initState();
  }



  @override
  Widget build(BuildContext context) {

    return YoutubePlayer(
      controller: _controller,
      liveUIColor: Colors.amber,
    );
  }
}