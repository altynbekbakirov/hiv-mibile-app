import 'package:hiv/model/audio.dart';
import 'package:hiv/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class PlayerControls extends StatelessWidget {
  const PlayerControls({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<Audio>(
      builder: (_, audioModel, child) => Row(
        children: <Widget>[
          _ControlButton(
              icon: Icon(FontAwesomeIcons.stepBackward,
                  size: 20, color: kModerateBlue),
              onTap: () => print("hello")),
          _ControlButton(
              icon: Icon(
                  audioModel.audioState == 'Playing'
                      ? Icons.pause_circle_outline
                      : Icons.play_circle_outline,
                  size: 20,
                  color: kModerateBlue),
              onTap: () {
                audioModel.audioState == "Playing"
                    ? audioModel.pauseAudio()
                    : audioModel.playAudio(
                        "http://138.68.82.38//storage/audios/%D0%9C%D0%BE%D0%B4%D1%83%D0%BB%D1%8C%201/20201219171245m1_03.mp3");
              }),
          _ControlButton(
              icon: Icon(FontAwesomeIcons.stepForward,
                  size: 20, color: kModerateBlue),
              onTap: () => print("hello")),
        ],
      ),
    );
  }
}

class _ControlButton extends StatelessWidget {
  final Widget icon;
  final Function onTap;
  final double buttonSize;

  const _ControlButton({Key key, this.icon, this.onTap, this.buttonSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<Audio>(
      builder: (_, audioModel, child) => ButtonTheme(
        child: InkWell(
          child: icon,
          onTap: onTap,
        ),
      ),
    );
  }
}
