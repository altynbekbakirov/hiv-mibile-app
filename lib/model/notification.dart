//import 'dart:async';
//
//import 'package:flutter/cupertino.dart';
//import 'package:flutter/material.dart';
//
//import '../data/pref_manager.dart';
//
//class LocalNotification {
//  final int id;
//  final String title;
//  final String body;
//  final int hour;
//  final int minute;
//  final List days;
//
//  LocalNotification({this.id, this.title, this.body, this.hour, this.minute, this.days});
//}
//
//class LocalNotificationsHandler extends ChangeNotifier{
//  final List<LocalNotification> _list = new List<LocalNotification>();
//
//
//  List<LocalNotification> get list => _list;
//  int get length =>_list.length;
//
//  Future<void> addNotification(LocalNotification notification) async {
//    _list.add(notification);
//    notifyListeners();
//  }
//}