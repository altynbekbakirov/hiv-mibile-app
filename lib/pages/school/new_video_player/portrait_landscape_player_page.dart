import 'package:hiv/pages/school/new_video_player/video_player_both_widget.dart';
import 'package:hiv/pages/school/youtube/video_player.dart';
import 'package:ext_video_player/ext_video_player.dart';
import 'package:flutter/material.dart';

class PortraitLandscapePlayerPage extends StatefulWidget {
  final String url;
  final List<YoutubeVideoModel> videos;

  const PortraitLandscapePlayerPage({Key key, this.url, this.videos}) : super(key: key);

  @override
  _PortraitLandscapePlayerPageState createState() =>
      _PortraitLandscapePlayerPageState();
}

class _PortraitLandscapePlayerPageState
    extends State<PortraitLandscapePlayerPage> {
  VideoPlayerController controller;

  @override
  void initState() {
    super.initState();

    controller = VideoPlayerController.network(widget.url)
      ..addListener(() => setState(() {}))
      ..setLooping(true)
      ..initialize().then((_) => controller.pause());
  }

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(toolbarHeight: 0),
    body: VideoPlayerBothWidget(controller: controller),
  );
}