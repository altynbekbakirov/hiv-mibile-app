import 'package:flutter/cupertino.dart';

class VideoUI extends ChangeNotifier {

  bool _isShowAppbar = true;
  bool _isPortrait = true;

  bool get isShowAppbar => _isShowAppbar;
  bool get isPortrait => _isPortrait;

  setAppbarState(bool value) {
    _isShowAppbar = value;
    notifyListeners();
  }

  setPortrait(bool value) {
    _isPortrait = value;
    notifyListeners();
  }
}