import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class Audio extends ChangeNotifier {
  Duration totalDuration;
  Duration position;
  String audioState;
  int duration;

  AudioPlayer audioPlayer = AudioPlayer();

  Audio() {
    initAudio();
  }

  initAudio() {
    audioPlayer.onDurationChanged.listen((updatedDuration) {
      totalDuration = updatedDuration;
      notifyListeners();
    });

    audioPlayer.onAudioPositionChanged.listen((updatedPosition) {
      position = updatedPosition;
      notifyListeners();
    });

    audioPlayer.onPlayerStateChanged.listen((playerState) {
      if (playerState == AudioPlayerState.PLAYING) audioState = "Playing";
      if (playerState == AudioPlayerState.PAUSED) audioState = "Paused";
      notifyListeners();
    });
  }

  void playAudio(String url) {
    audioPlayer.play(url);
  }

  void pauseAudio() {
    audioPlayer.pause();
  }

  void seekAudio(Duration durationToSeek){
    audioPlayer.seek(durationToSeek);
  }

  getDurations(String recordPath) async {
    duration = await audioPlayer.setUrl(recordPath);
  }
}
