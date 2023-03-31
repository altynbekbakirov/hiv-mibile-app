import 'package:flutter/cupertino.dart';

class Symptoms extends ChangeNotifier{
  String _dateTime;

  String get dateTime => _dateTime ?? DateTime.now().toString();

  void setDateTimeState(String dateTime){
    _dateTime = dateTime;
    notifyListeners();
  }
}