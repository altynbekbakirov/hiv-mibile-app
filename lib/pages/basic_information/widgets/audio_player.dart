import 'package:HIVApp/model/audio.dart';
import 'package:HIVApp/pages/basic_information/widgets/player_controller.dart';
import 'package:HIVApp/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:provider/provider.dart';

class AudioPlayerWidget extends StatefulWidget {
  final int index;

  const AudioPlayerWidget({Key key, this.index}) : super(key: key);

  @override
  _AudioPlayerWidgetState createState() => _AudioPlayerWidgetState();
}

class _AudioPlayerWidgetState extends State<AudioPlayerWidget> {
  format(Duration d) => d.toString().split('.').first.padLeft(8, "0");

  TextStyle timeStyle = TextStyle(color: kModerateBlue, fontSize: 12);

  @override
  Widget build(BuildContext context) {
    return Consumer<Audio>(
      builder: (_, audioModel, child) => Container(
        child: Column(
          children: [
            PlayerControls(),
            slider(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  audioModel.position != null
                      ? Text(format(audioModel.position), style: timeStyle)
                      : Text("00:00:00", style: timeStyle),
                  audioModel.totalDuration != null
                      ? Text(format(audioModel.totalDuration), style: timeStyle)
                      : Text("00:00:00", style: timeStyle),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget slider() {
  return SliderTheme(
    data: SliderThemeData(
//          trackHeight: 2,
        trackShape: CustomTrackShape(),
        activeTrackColor: Colors.red,
        disabledActiveTrackColor: Colors.red,
        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 7)),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Consumer<Audio>(
        builder: (_, audioModel, child) => Slider(
            activeColor: kModerateBlue,
            inactiveColor: Colors.red,
            value: audioModel.position == null
                ? 0
                : audioModel.position.inMilliseconds.toDouble(),
            min: 0.0,
            max: audioModel.totalDuration == null
                ? 0
                : audioModel.totalDuration.inMilliseconds.toDouble(),
            onChanged: (double value) {
              audioModel.seekAudio(Duration(milliseconds: value.toInt()));
            }),
      ),
    ),
  );
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
