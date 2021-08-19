import 'package:HIVApp/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:http/http.dart' as http;
import 'package:HIVApp/data/configs.dart';
import 'package:HIVApp/data/pref_manager.dart';

import 'dart:convert';

class VideoCategoryModel {
  String category_name;
  List<VideoFileModel> videos;

  VideoCategoryModel({this.category_name, this.videos});
}

class VideoFileModel {
  String title;
  String name;

  VideoFileModel({this.title, this.name});

  static Future<List<VideoCategoryModel>> getList() async {
    final url = Configs.ip + 'api/videoinformations';
    try {
      Map<String, String> headers = {
        "Content-type": "application/json",
        "lang": Prefs.getString(Prefs.LANGUAGE)
      };
      final response = await http.get(
        url,
        headers: headers,
      );
      List<VideoCategoryModel> mmList = new List<VideoCategoryModel>();
      for (var i in json.decode(response.body)) {
        VideoCategoryModel newModel = new VideoCategoryModel(
            category_name: i['category_name'],
            videos: responseToObjects(i['videos']));
        mmList.add(newModel);
      }
      return mmList;
    } catch (error) {
      throw error;
    }
  }

  static List<VideoFileModel> responseToObjects(var responseBody) {
    List<VideoFileModel> list = new List<VideoFileModel>();
    for (var j in responseBody) {
      VideoFileModel model = new VideoFileModel();
      model.name = j['path'];
      model.title = j['name'];

      list.add(model);
    }
    return list;
  }
}

class VideoWidget extends StatefulWidget {
  List<VideoFileModel> list;

  VideoWidget({this.list});

  @override
  _VideoWidgetState createState() => _VideoWidgetState();
}

class _VideoWidgetState extends State<VideoWidget> {
  List<VideoFileModel> _list = new List<VideoFileModel>();

  @override
  void initState() {
    widget.list != null ? _list = widget.list : null;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(
          0.0,
          MediaQuery.of(context).size.height * 0.02,
          0.0,
          MediaQuery.of(context).size.height * 0.02),
      height: MediaQuery.of(context).size.height * 0.7,
      child: ListView.builder(
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Card(
              child: Stack(
                  alignment: FractionalOffset.bottomRight +
                      const FractionalOffset(-0.1, -0.1),
                  children: <Widget>[
                    _ButterFlyAssetVideo(
                      title: _list[index].title,
                      fileName: Configs.file_ip + _list[index].name,
                    ),
                  ]),
            );
          },
          itemCount: _list.length),
    );
  }
}

class _ButterFlyAssetVideo extends StatefulWidget {
  String title;
  String fileName;

  _ButterFlyAssetVideo({this.title, this.fileName});

  @override
  _ButterFlyAssetVideoState createState() => _ButterFlyAssetVideoState();
}

class _ButterFlyAssetVideoState extends State<_ButterFlyAssetVideo> {
  VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.fileName);

    _controller.addListener(() {
      setState(() {});
    });
    _controller.setLooping(true);
    _controller.initialize().then((_) => setState(() {}));
//    _controller.play();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kLightGrayishBlue,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: AspectRatio(
                aspectRatio: 16.0 / 9.0,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: <Widget>[
                    VideoPlayer(_controller),
                    _ControlsOverlay(controller: _controller),
                    VideoProgressIndicator(_controller, allowScrubbing: true)
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            Text(widget.title,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black)),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class _ControlsOverlay extends StatelessWidget {
  const _ControlsOverlay({Key key, this.controller}) : super(key: key);

  static const _examplePlaybackRates = [
    0.25,
    0.5,
    1.0,
    1.5,
    2.0,
    3.0,
    5.0,
    10.0,
  ];

  final VideoPlayerController controller;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AnimatedSwitcher(
          duration: Duration(milliseconds: 50),
          reverseDuration: Duration(milliseconds: 200),
          child: controller.value.isPlaying
              ? SizedBox.shrink()
              : Container(
            color: Colors.black26,
            child: Center(
              child: Icon(
                Icons.play_arrow,
                color: Colors.white,
                size: 70.5,
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            controller.value.isPlaying ? controller.pause() : controller.play();
          },
        ),
        Align(
          alignment: Alignment.topRight,
          child: PopupMenuButton<double>(
            initialValue: controller.value.playbackSpeed,
            tooltip: 'Playback speed',
            onSelected: (speed) {
              controller.setPlaybackSpeed(speed);
            },
            itemBuilder: (context) {
              return [
                for (final speed in _examplePlaybackRates)
                  PopupMenuItem(
                    value: speed,
                    child: Text('${speed}x'),
                  )
              ];
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(
                // Using less vertical padding as the text is also longer
                // horizontally, so it feels like it would need more spacing
                // horizontally (matching the aspect ratio of the video).
                vertical: 12,
                horizontal: 16,
              ),
              child: Text('${controller.value.playbackSpeed}x'),
            ),
          ),
        ),
      ],
    );
  }
}

/*
class _PlayerVideoAndPopPage extends StatefulWidget {
  @override
  _PlayerVideoAndPopPageState createState() => _PlayerVideoAndPopPageState();
}

class _PlayerVideoAndPopPageState extends State<_PlayerVideoAndPopPage> {
  VideoPlayerController _videoPlayerController;
  bool startedPlaying = false;

  @override
  void initState() {
    super.initState();

    _videoPlayerController =
        VideoPlayerController.asset('assets/videos/hiv1.mp4');
    _videoPlayerController.addListener(() {
      if (startedPlaying && !_videoPlayerController.value.isPlaying) {
        Navigator.pop(context);
      }
    });
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }

  Future<bool> started() async {
    await _videoPlayerController.initialize();
    await _videoPlayerController.play();
    startedPlaying = true;
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 0,
      child: Center(
        child: FutureBuilder<bool>(
          future: started(),
          builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
            if (snapshot.data == true) {
              return AspectRatio(
                aspectRatio: _videoPlayerController.value.aspectRatio,
                child: VideoPlayer(_videoPlayerController),
              );
            } else {
              return const Text('waiting for video to load');
            }
          },
        ),
      ),
    );
  }
}*/
