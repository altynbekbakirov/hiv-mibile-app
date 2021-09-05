import 'package:HIVApp/model/videoUI_provider.dart';
import 'package:HIVApp/utils/constants.dart';
import 'package:auto_orientation/auto_orientation.dart';
import 'package:ext_video_player/ext_video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class YoutubeVideoWidget extends StatefulWidget {
  final String title;
  final String id;

  YoutubeVideoWidget({this.title, this.id});

  @override
  _YoutubeVideoWidgetState createState() => _YoutubeVideoWidgetState();
}

class _YoutubeVideoWidgetState extends State<YoutubeVideoWidget> {
  VideoPlayerController _controller;
  VideoPlayer videoPlayer;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
      'https://www.youtube.com/watch?v=' + widget.id,
    );
    _controller.addListener(() {
      setState(() {});
    });
    _controller.setLooping(true);
    _controller.initialize();
    setAllOrientations();
    setLandscape();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future setAllOrientations() async {
    await SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    await SystemChrome.setPreferredOrientations(DeviceOrientation.values);
  }

  Future setLandscape() async {
    await SystemChrome.setEnabledSystemUIOverlays([]);
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
      DeviceOrientation.portraitUp,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: AspectRatio(
              aspectRatio: 16 / 9,
              child: OrientationBuilder(
                builder: (context, orientation) {
                  var isPortrait = orientation == Orientation.portrait;
                  return Stack(
                    fit: StackFit.expand,
                    alignment: Alignment.bottomCenter,
                    children: <Widget>[
                      VideoPlayer(_controller),
                      ClosedCaption(text: _controller.value.caption.text),
                      _VideoPlayerOverlay(controller: _controller),
                    ],
                  );
                },
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(bottom: 20, left: 16, right: 16),
            child: Text(
              widget.title,
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}

class _VideoPlayerOverlay extends StatefulWidget {
  const _VideoPlayerOverlay({Key key, this.controller}) : super(key: key);
  final VideoPlayerController controller;

  @override
  _VideoPlayerOverlayState createState() => _VideoPlayerOverlayState();
}

class _VideoPlayerOverlayState extends State<_VideoPlayerOverlay> {
  bool isVisibility = true;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        var provider = Provider.of<VideoUI>(context, listen: false);
        AutoOrientation.portraitUpMode();
        provider.setAppbarState(true);
        provider.setPortrait(true);
        return;
      },
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          AnimatedSwitcher(
            duration: Duration(milliseconds: 50),
            reverseDuration: Duration(milliseconds: 200),
            child: widget.controller.value.isPlaying
                ? isVisibility
                    ? Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.asset(
                              "assets/images/left-backward.png",
                              scale: 15,
                              color: Colors.white,
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Icon(
                                Icons.pause_circle_outline,
                                color: Colors.white,
                                size: 50.0,
                              ),
                            ),
                            Image.asset(
                              "assets/images/right-backward.png",
                              scale: 15,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      )
                    : SizedBox.shrink()
                : Container(
                    color: Colors.black26,
                    child: Center(
                      child: Icon(
                        Icons.play_arrow,
                        color: Colors.white,
                        size: 50.0,
                      ),
                    ),
                  ),
          ),

          ///progress indicator
          isVisibility
              ? Align(
                  alignment: Alignment.bottomCenter,
                  child: VideoProgressIndicator(
                    widget.controller,
                    colors: VideoProgressColors(
                      bufferedColor: Colors.grey,
                      backgroundColor: kLightGrayishBlue,
                      playedColor: kModerateBlue,
                    ),
                    allowScrubbing: true,
                    padding: EdgeInsets.only(bottom: 30),
                  ),
                )
              : SizedBox.shrink(),

          ///position and duration
          isVisibility
              ? Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ValueListenableBuilder(
                      valueListenable: widget.controller,
                      builder: (context, VideoPlayerValue value, child) {
                        return Text(
                          "${value.position.toString().split(":")[1]}:${value.position.toString().split(":")[2].split(".")[0]} / ${value.duration != null ? "${value.duration.toString().split(":")[1]}:${value.duration.toString().split(":")[2].split('.')[0]}" : '0:00'}",
                          style: TextStyle(color: Colors.white),
                        );
                      },
                    ),
                  ),
                )
              : SizedBox.shrink(),

          ///fullscreen widget
          Align(
            alignment: Alignment.bottomRight,
            child: GestureDetector(
              onTap: () => _onClickedFullScreen(),
              child: Icon(Icons.fullscreen, color: Colors.white, size: 28),
            ),
          ),

          ///play pause mode
          GestureDetector(
            child: Container(
              height: 60,
              width: 60,
              child: Text(""),
            ),
            onTap: () {
              if (widget.controller.value.isPlaying) {
                widget.controller.pause();
              } else {
                widget.controller.play();
                setState(() {
                  isVisibility = true;
                });
                Future.delayed(Duration(seconds: 4), () {
                  setState(() {
                    isVisibility = false;
                  });
                });
              }
            },
          ),

          ///skip back
          Padding(
            padding: Provider.of<VideoUI>(context).isPortrait
                ? const EdgeInsets.only(right: 150)
                : const EdgeInsets.only(right: 340),
            child: GestureDetector(
              child: Container(
                height: 30,
                width: 30,
                child: Text(""),
              ),
              onTap: () {
                setState(() {
                  isVisibility = true;
                });
                rewind5Seconds();
                Future.delayed(Duration(seconds: 4), () {
                  setState(() {
                    isVisibility = false;
                  });
                });
              },
            ),
          ),

          ///skip forward
          Padding(
            padding: Provider.of<VideoUI>(context).isPortrait
                ? const EdgeInsets.only(left: 150)
                : const EdgeInsets.only(left: 340),
            child: GestureDetector(
                child: Container(
                  height: 30,
                  width: 30,
                  child: Text(""),
                ),
                onTap: () {
                  setState(() {
                    isVisibility = true;
                  });
                  forward5Seconds();
                  Future.delayed(Duration(seconds: 4), () {
                    setState(() {
                      isVisibility = false;
                    });
                  });
                }),
          ),
        ],
      ),
    );
  }

  _onClickedFullScreen() {
    var provider = Provider.of<VideoUI>(context, listen: false);
    var isPortrait = provider.isPortrait;
    if (isPortrait) {
      AutoOrientation.landscapeRightMode();
      provider.setAppbarState(false);
      provider.setPortrait(false);
    } else {
      AutoOrientation.portraitUpMode();
      provider.setAppbarState(true);
      provider.setPortrait(true);
    }
  }

  Future forward5Seconds() async =>
      goToPosition((currentPosition) => currentPosition + Duration(seconds: 5));

  Future rewind5Seconds() async =>
      goToPosition((currentPosition) => currentPosition - Duration(seconds: 5));

  Future goToPosition(
      Duration Function(Duration currentPosition) builder) async {
    final currentPosition = await widget.controller.position;
    final newPosition = builder(currentPosition);
    await widget.controller.seekTo(newPosition);
  }
}
