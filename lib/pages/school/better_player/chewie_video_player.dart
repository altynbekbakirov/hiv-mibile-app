import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class ChewieVideoPlayerWidget extends StatefulWidget {
  const ChewieVideoPlayerWidget({Key key}) : super(key: key);

  @override
  _ChewieVideoPlayerWidgetState createState() =>
      _ChewieVideoPlayerWidgetState();
}

class _ChewieVideoPlayerWidgetState extends State<ChewieVideoPlayerWidget> {
  TargetPlatform _platform;
  VideoPlayerController _videoPlayerController1;
  VideoPlayerController _videoPlayerController2;
  ChewieController _chewieController;

  @override
  void initState() {
    super.initState();
    initializePlayer();
  }

  @override
  void dispose() {
    _videoPlayerController1.dispose();
    _videoPlayerController2.dispose();
    _chewieController?.dispose();
    super.dispose();
  }

  Future<void> initializePlayer() async {
    _videoPlayerController1 = VideoPlayerController.network(
      'https://assets.mixkit.co/videos/preview/mixkit-daytime-city-traffic-aerial-view-56-large.mp4',
      videoPlayerOptions: VideoPlayerOptions(
        mixWithOthers: true,
      )
    );
    _videoPlayerController2 = VideoPlayerController.network(
      'https://assets.mixkit.co/videos/preview/mixkit-a-girl-blowing-a-bubble-gum-at-an-amusement-park-1226-large.mp4',
    );
    await Future.wait([
      _videoPlayerController1.initialize(),
      _videoPlayerController2.initialize()
    ]);
    _createChewieController();
    setState(() {});
  }

  void _createChewieController() {
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController1,
      allowFullScreen: true,
      aspectRatio: 16 / 9,
      cupertinoProgressColors: ChewieProgressColors(
        backgroundColor: Colors.red,
        playedColor: Colors.red,
        bufferedColor: Colors.red,
        handleColor: Colors.red,
      ),
      showControls: true,
      customControls: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Stack(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    color: Colors.red,
                    height: 30,
                    width: 30,
                  ),
                  Container(
                    color: Colors.red,
                    height: 30,
                    width: 30,
                  ),
                  Container(
                    color: Colors.red,
                    height: 30,
                    width: 30,
                  )
                ],
              ),
            ],
          ),


        ],
      ),
      // overlay: Column(
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   crossAxisAlignment: CrossAxisAlignment.center,
      //   children: <Widget>[
      //     Center(
      //         child: Container(
      //       color: Colors.red,
      //       height: 30,
      //       width: 30,
      //     ))
      //   ],
      // ),
      autoPlay: false,
      looping: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Center(
            child: _chewieController != null &&
                    _chewieController.videoPlayerController.value.initialized
                ? Stack(
                  children: [
                    Chewie(
                      controller: _chewieController,
                    ),
                    Text("HHHHHHHHHHHHHHHHHHHHHH")
                  ]
                )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      CircularProgressIndicator(),
                      SizedBox(height: 20),
                      Text('Loading'),
                    ],
                  ),
          ),
        ),
        TextButton(
          onPressed: () {
            _chewieController?.enterFullScreen();
          },
          child: const Text('Fullscreen'),
        ),
        Row(
          children: <Widget>[
            Expanded(
              child: TextButton(
                onPressed: () {
                  setState(() {
                    _videoPlayerController1.pause();
                    _videoPlayerController1.seekTo(const Duration());
                    _createChewieController();
                  });
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: Text("Landscape Video"),
                ),
              ),
            ),
            Expanded(
              child: TextButton(
                onPressed: () {
                  setState(() {
                    _videoPlayerController2.pause();
                    _videoPlayerController2.seekTo(const Duration());
                    _chewieController = ChewieController(
                      videoPlayerController: _videoPlayerController2,
                      autoPlay: true,
                      looping: true,
                    );
                  });
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: Text("Portrait Video"),
                ),
              ),
            )
          ],
        ),
        Row(
          children: <Widget>[
            Expanded(
              child: TextButton(
                onPressed: () {
                  setState(() {
                    _platform = TargetPlatform.android;
                  });
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: Text("Android controls"),
                ),
              ),
            ),
            Expanded(
              child: TextButton(
                onPressed: () {
                  setState(() {
                    _platform = TargetPlatform.iOS;
                  });
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: Text("iOS controls"),
                ),
              ),
            )
          ],
        ),
        Row(
          children: <Widget>[
            Expanded(
              child: TextButton(
                onPressed: () {
                  setState(() {
                    _platform = TargetPlatform.windows;
                  });
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: Text("Desktop controls"),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
