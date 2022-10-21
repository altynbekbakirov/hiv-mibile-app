import 'package:HIVApp/utils/constants.dart';
import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BetterPlayerWidget extends StatefulWidget {
  const BetterPlayerWidget({Key key, this.title, this.path}) : super(key: key);

  final String title;
  final String path;

  @override
  _BetterPlayerWidgetState createState() => _BetterPlayerWidgetState();
}

class _BetterPlayerWidgetState extends State<BetterPlayerWidget> {
  String path;
  String title;

  var dataSourceList;

  BetterPlayerController _betterPlayerController;

  @override
  void initState() {
    path = widget.path;
    title = widget.title;
    BetterPlayerDataSource betterPlayerDataSource = BetterPlayerDataSource(
      BetterPlayerDataSourceType.network,
      path,
    );

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
    ]);

    _betterPlayerController = BetterPlayerController(
      BetterPlayerConfiguration(
          autoPlay: false,
          looping: false,
          deviceOrientationsAfterFullScreen: [
            DeviceOrientation.landscapeLeft,
            DeviceOrientation.landscapeRight,
            DeviceOrientation.portraitUp,
          ],
          deviceOrientationsOnFullScreen: [
            DeviceOrientation.landscapeLeft,
            DeviceOrientation.landscapeRight,
            DeviceOrientation.portraitUp,
          ],
          controlsConfiguration: BetterPlayerControlsConfiguration(
            iconsColor: Colors.white,
            enableFullscreen: true,
            enablePlayPause: true,
            progressBarPlayedColor: kModerateBlue,
            progressBarHandleColor: kModerateBlue,
            controlBarColor: Colors.transparent,
            enableMute: false,
            enableOverflowMenu: false,
          )),
      betterPlayerDataSource: betterPlayerDataSource,
    );
    super.initState();
  }

  @override
  dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    _betterPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AspectRatio(
          aspectRatio: 16 / 9,
          child: BetterPlayer(
            controller: _betterPlayerController,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "$title",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
              )),
        ),
      ],
    );
  }
}
