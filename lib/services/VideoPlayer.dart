import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayer extends StatefulWidget {
  VideoPlayerController videoPlayerController;
  bool islooping;
  VideoPlayer({required this.videoPlayerController, required this.islooping});

  @override
  State<VideoPlayer> createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> {
  ChewieController? chewieController;
  @override
  void initState() {
    chewieController = ChewieController(
        videoPlayerController: widget.videoPlayerController,
        looping: widget.islooping,
        aspectRatio: 16 / 9,
        autoInitialize: true);

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Chewie(
      controller: chewieController!,
    );
  }
}

class VideoDisplay extends StatefulWidget {
  String videoUrl;

  VideoDisplay({required this.videoUrl});
  @override
  State<VideoDisplay> createState() => _VideoDisplayState();
}

class _VideoDisplayState extends State<VideoDisplay> {
  @override
  Widget build(BuildContext context) {
    return VideoPlayer(videoPlayerController: VideoPlayerController.network(widget.videoUrl), islooping: true);
  }
}
