import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:HIVApp/data/configs.dart';
import 'package:HIVApp/data/pref_manager.dart';
import 'package:HIVApp/utils/constants.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

import '../../../db/audio_db.dart';

import 'player_widget.dart';

typedef void OnError(Exception exception);

const kUrl1 =
    'http://vich.ulut.kg/storage/audios/%D0%92%D0%B2%D0%B5%D0%B4%D0%B5%D0%BD%D0%B8%D0%B5/202012021512481.mp3';

class AudioCategoryModel {
  String category_name;
  List<AudioFileModel> audios;

  AudioCategoryModel({this.category_name, this.audios});
}

class AudioFileModel {
  String title;
  String name;
  bool downloaded = false;

  AudioFileModel({this.title, this.name, this.downloaded});

  static Future<List<AudioCategoryModel>> getList() async {
    final url = Configs.ip + 'api/audioinformations';
    try {
      Map<String, String> headers = {
        "Content-type": "application/json",
        "lang": Prefs.getString('language', def: null)
      };
      final response = await http.get(
        url,
        headers: headers,
      );
      List<AudioCategoryModel> mmList = new List<AudioCategoryModel>();
      for (var i in json.decode(response.body)) {
        AudioCategoryModel newModel = new AudioCategoryModel(
            category_name: i['category_name'],
            audios: responseToObjects(i['audios']));
        mmList.add(newModel);
      }
      return mmList;
    } catch (error) {
      throw error;
    }
  }

  static List<AudioFileModel> responseToObjects(var responseBody) {
    List<AudioFileModel> list = new List<AudioFileModel>();
    for (var j in responseBody) {
      AudioFileModel model = new AudioFileModel();
      model.name = j['path'];
      model.title = j['name'];
      model.downloaded = false;

      list.add(model);
    }
    return list;
  }
}

class AudioApp extends StatefulWidget {
  List<AudioFileModel> list;
  List<AudioDb> dbList;
  String category_name;

  AudioApp({this.list, this.dbList, this.category_name});

  @override
  _AudioAppState createState() => _AudioAppState();
}

class _AudioAppState extends State<AudioApp> {
  AudioCache audioCache = AudioCache();
  AudioPlayer advancedPlayer = AudioPlayer();
  AudioPlayer player = AudioPlayer();
  String fileName = 'audios';
  int fileIndex = 0;
  double pinPillPosition = -1000;
  double playerHeight = 0;
  bool playing = false;
  String category_name;
  List<Duration> durations = List<Duration>();
  int p;

  String path =
      'http://138.68.82.38/storage/audios/Введение/20201216161221intro_01.mp3';

  Duration _duration = new Duration();
  Duration _position = new Duration();

  List<AudioFileModel> files = new List<AudioFileModel>();
  List<AudioDb> dbList = new List<AudioDb>();

  List<AudioFileModel> compareRemoteLocalAudios(
      List<AudioFileModel> someList, List<AudioDb> anotherList) {
    List<AudioFileModel> newList = new List<AudioFileModel>();
    for (var i in someList) {
      AudioFileModel newModel = new AudioFileModel();
      newModel.title = i.title;
      newModel.name = i.name;
      if (i.downloaded == null)
        newModel.downloaded = false;
      else
        newModel.downloaded = i.downloaded;
      for (var j in anotherList) {
        if (i.name == j.remote_path) {
          newModel.downloaded = true;
          newModel.name = j.local_path;
          break;
        }
      }
      newList.add(newModel);
    }
    return newList;
  }

  @override
  void initState() {
    super.initState();
    category_name = widget.category_name;
    files = compareRemoteLocalAudios(widget.list, widget.dbList);
    if (kIsWeb) {
      // Calls to Platform.isIOS fails on web
      return;
    }
    if (Platform.isIOS) {
      if (audioCache.fixedPlayer != null) {
        audioCache.fixedPlayer.startHeadlessService();
      }
      advancedPlayer.startHeadlessService();
    }
    audioCache.fixedPlayer = advancedPlayer;
    initPlayer();
    getAudioDurations();
  }

  void getAudioDurations() async {
    var ip = Configs.file_ip;
    for (var i in files) {
      player.setUrl(ip + i.name);
    }
  }

  void initPlayer() {
    advancedPlayer.onDurationChanged.listen((Duration d) {
      setState(() {
        _duration = d;
      });
    });

    player.onDurationChanged.listen((Duration d) {
      setState(() {
        durations.add(d);
      });
    });

    advancedPlayer.onAudioPositionChanged.listen((Duration d) {
      setState(() {
        _position = d;
      });
    });
  }

  void seekToSecond(int second) {
    Duration newDuration = Duration(seconds: second);
    advancedPlayer.seek(newDuration);
  }

  Widget slider() {
    return SliderTheme(
      data: SliderThemeData(
          trackShape: CustomTrackShape(),
          thumbShape: RoundSliderThumbShape(enabledThumbRadius: 7)),
      child: Slider(
          activeColor: kModerateBlue,
          inactiveColor: kLightGrayishBlue,
          value: _position.inSeconds.toDouble(),
          min: 0.0,
          max: _duration.inSeconds.toDouble(),
          onChanged: (double value) {
            setState(() {
              seekToSecond(value.toInt());
              value = value;
            });
          }),
    );
  }

  Widget remoteUrl() {
    return SingleChildScrollView(
      child: _Tab(children: [
        Text(
          'Sample 1 ($kUrl1)',
          key: Key('url1'),
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        PlayerWidget(url: kUrl1),
      ]),
    );
  }

  Widget localAsset() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.7,
      width: MediaQuery.of(context).size.width,
      child: Stack(children: [
        Container(
          padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
          height: MediaQuery.of(context).size.height * 0.70 - playerHeight,
          child: ListView.separated(
              separatorBuilder: (BuildContext context, int index) => Divider(),
              itemCount: files.length,
              itemBuilder: (BuildContext ctxt, int index) {
                return ListTile(
                  leading: GestureDetector(
                    onTap: () {
                      print(index);
                      print(durations);
                    },
                    child: Text("${durations[index].toString().split(".")[0]}"),
                  ),
                  title: Text(
                    files[index].title,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  trailing: Icon(
                    fileName == files[index].name
                        ? FontAwesomeIcons.pause
                        : FontAwesomeIcons.play,
                    color: kModerateBlue,
                    size: 20,
                  ),
                  onTap: () async {
                    setState(() {
                      fileIndex = index;
                      audioCache.clearCache();
                      advancedPlayer.stop();
                      fileName = files[index].name;
                      var sss = Configs.file_ip;
                      if (files[index].downloaded)
                        advancedPlayer.play(fileName);
                      else
                        advancedPlayer.play(sss + fileName);
                      pinPillPosition =
                          MediaQuery.of(context).size.height * 0.001;
                      playerHeight = MediaQuery.of(context).size.height * 0.20;
                      playing = true;
                    });
                  },
                );
              }),
        ),
        AnimatedPositioned(
          bottom: pinPillPosition,
          right: 0,
          left: 0,
          duration: Duration(milliseconds: 200),
          child: Container(
              height: 170,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: kColorWhite,
                borderRadius: BorderRadius.horizontal(
                    right: Radius.circular(12), left: Radius.circular(12)),
              ),
              child: Column(children: <Widget>[
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: _Btn1(
                          txt: Image.asset("assets/images/left-player.png",
                              scale: 19),
                          onPressed: () {
                            setState(() {
                              if (fileIndex == 0) {
                                fileIndex = files.length - 1;
                              } else {
                                fileIndex = fileIndex - 1;
                              }
                              fileName = files[fileIndex].name;
                              if (files[fileIndex].downloaded)
                                advancedPlayer.play(fileName);
                              else
                                advancedPlayer.play(Configs.file_ip + fileName);
                              playing = true;
                            });
                          },
                        ),
                      ),
                      Expanded(
                        child: _Btn1(
                          txt: Image.asset("assets/images/left-backward.png",
                              scale: 19),
                          onPressed: () {
                            setState(() {
                              seekToSecond(_position.inSeconds - 10);
                            });
                          },
                        ),
                      ),
                      Expanded(
                        child: _Btn1(
                          txt: Icon(
                            playing
                                ? FontAwesomeIcons.pauseCircle
                                : FontAwesomeIcons.playCircle,
                            size: 40,
                            color: kModerateBlue,
                          ),
                          onPressed: () {
                            if (advancedPlayer.state ==
                                AudioPlayerState.PLAYING) {
                              advancedPlayer.pause();
                            } else if (advancedPlayer.state ==
                                AudioPlayerState.PAUSED) {
                              if (files[fileIndex].downloaded)
                                advancedPlayer.play(fileName);
                              else
                                advancedPlayer.play(Configs.file_ip + fileName);
                            } else if (advancedPlayer.state ==
                                AudioPlayerState.STOPPED) {
                              if (files[fileIndex].downloaded)
                                advancedPlayer.play(fileName);
                              else
                                advancedPlayer.play(Configs.file_ip + fileName);
                            } else {
                              advancedPlayer.pause();
                            }
                            setState(() {
                              playing = !playing;
                            });
                          },
                        ),
                      ),
                      Expanded(
                        child: _Btn1(
                          txt: Image.asset("assets/images/right-backward.png",
                              scale: 19),
                          onPressed: () {
                            setState(() {
                              setState(() {
                                seekToSecond(_position.inSeconds + 10);
                              });
                            });
                          },
                        ),
                      ),
                      Expanded(
                        child: _Btn1(
                          txt: Image.asset("assets/images/right-player.png",
                              scale: 19),
                          onPressed: () {
                            setState(() {
                              if (fileIndex < files.length - 1) {
                                fileIndex = fileIndex + 1;
                              } else if (fileIndex >= files.length - 1) {
                                fileIndex = 0;
                              }
                              fileName = files[fileIndex].name;
                              if (files[fileIndex].downloaded)
                                advancedPlayer.play(fileName);
                              else
                                advancedPlayer.play(Configs.file_ip + fileName);
                              playing = true;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ), // first widget
                Container(
                    width: MediaQuery.of(context).size.width * 0.95,
                    child: Column(
                      children: [
                        slider(),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                (_position.toString().split(".")[0]),
                                style: TextStyle(color: kModerateBlue),
                              ),
                              // getLocalFileDuration(),
                              Text(
                                _duration.toString().split(".")[0],
                                style: TextStyle(color: kModerateBlue),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )),
              ])), // end of Align
        ),
      ]),
    );
  }

  Future<int> _getDuration() async {
    File audioFile = await audioCache.load(fileName);
    await advancedPlayer.setUrl(
      audioFile.path,
    );
    int duration = await Future.delayed(
      Duration(seconds: 2),
      () => advancedPlayer.getDuration(),
    );
    return duration;
  }

  getLocalFileDuration() {
    return FutureBuilder<int>(
      future: _getDuration(),
      builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            return Text('No Connection...');
          case ConnectionState.active:
          case ConnectionState.waiting:
            return Text('Awaiting result...');
          case ConnectionState.done:
            if (snapshot.hasError) return Text('Error: ${snapshot.error}');
            return Text(
              'audios/audio.mp3 duration is: ${Duration(milliseconds: snapshot.data)}',
            );
        }
        return null; // unreachable
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    audioCache.clearCache();
    advancedPlayer.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StreamProvider<Duration>.value(
            initialData: Duration(),
            value: advancedPlayer.onAudioPositionChanged),
      ],
      child: localAsset(),
    );
  }
}

class _Tab extends StatelessWidget {
  final List<Widget> children;

  const _Tab({Key key, this.children}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        alignment: Alignment.topCenter,
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: children
                .map((w) => Container(child: w, padding: EdgeInsets.all(6.0)))
                .toList(),
          ),
        ),
      ),
    );
  }
}

class CustomTrackShape extends RoundedRectSliderTrackShape {
  Rect getPreferredRect({
    @required RenderBox parentBox,
    Offset offset = Offset.zero,
    @required SliderThemeData sliderTheme,
    bool isEnabled = false,
    bool isDiscrete = false,
  }) {
    final double trackHeight = 2;
    final double trackLeft = offset.dx;
    final double trackTop =
        offset.dy + (parentBox.size.height - trackHeight) / 2.2;
    final double trackWidth = parentBox.size.width;
    return Rect.fromLTWH(trackLeft, trackTop, trackWidth, 2);
  }
}

class _Btn1 extends StatelessWidget {
  final Widget txt;
  final VoidCallback onPressed;

  const _Btn1({Key key, this.txt, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      minWidth: 30.0,
      child: InkWell(child: txt, onTap: onPressed),
    );
  }
}
