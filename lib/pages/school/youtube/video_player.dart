import 'package:HIVApp/pages/school/youtube/youtube_video.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:native_device_orientation/native_device_orientation.dart';

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
  Orientation target;

  @override
  void initState() {
    NativeDeviceOrientationCommunicator()
        .onOrientationChanged(useSensor: true)
        .listen((event) {
      final isPortrait = event == NativeDeviceOrientation.portraitUp;
      final isLandscape = event == NativeDeviceOrientation.landscapeLeft ||
          event == NativeDeviceOrientation.landscapeRight;
      final isTargetPortrait = target == Orientation.portrait;
      final isTargetLandscape = target == Orientation.landscape;

      if (isPortrait && isTargetPortrait || isLandscape && isTargetLandscape) {
        target = null;
        SystemChrome.setPreferredOrientations(DeviceOrientation.values);
      }
    });
    super.initState();
  }

  void setOrientation(bool isPortrait) {
    if (isPortrait) {
      SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    } else {
      SystemChrome.setEnabledSystemUIOverlays([]);
    }
  }

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
