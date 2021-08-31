import 'package:HIVApp/pages/school/youtube/youtube_video.dart';
import 'package:flutter/material.dart';

class YoutubeVideoModel {
  String id;
  String title;

  YoutubeVideoModel({this.id, this.title});
}

class VideoPlayerWidget extends StatefulWidget {
  const VideoPlayerWidget({Key key, this.videos}) : super(key: key);

  final List<YoutubeVideoModel> videos;

  @override
  _VideoPlayerWidgetState createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: ListView.builder(
          itemCount: widget.videos.length,
          itemBuilder: (context, index) {
            return Container(
              child: YoutubeVideoWidget(
                id: widget.videos[index].id,
                title: widget.videos[index].title,
              ),
            );
          },
        ),
      ),
    );
  }
}
