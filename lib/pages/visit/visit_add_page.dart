import 'dart:async';
import 'dart:io';
import 'dart:ui';

import 'package:HIVApp/components/text_form_field.dart';
import 'package:HIVApp/db/db_provider.dart';
import 'package:HIVApp/db/notification.dart';
import 'package:HIVApp/pages/add/notification_form.dart';
import 'package:HIVApp/pages/my_state/mood/add_mood_form.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:device_info/device_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:http/http.dart' as http;
import 'package:multiselect_formfield/multiselect_formfield.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/subjects.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:flutter_native_timezone/flutter_native_timezone.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../components/custom_button.dart';
import '../../utils/constants.dart';



class VisitAddPage extends StatefulWidget {

  @override
  _VisitAddPageState createState() => _VisitAddPageState();
}

class _VisitAddPageState extends State<VisitAddPage> {

  List<NotificationDb> _list = new List<NotificationDb>();

  @override
  initState(){
    super.initState();
    _getList();
  }

  _getList () async{
    await DBProvider.db.getAllNotifications().then((value) {
      setState(() {
        _list = value;
      });
    });
  }

  @override
  void dispose() {
    didReceiveLocalNotificationSubject.close();
    selectNotificationSubject.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('add'.tr()),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Center(
          child: ListView(
            children: <Widget>[
              ListTile(
                  title: Text(
                    'add_drug_notification'.tr(),
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  trailing: Icon(
                    Icons.chevron_right,
                    color: Colors.grey,
                  ),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) => NotificationForm(type: NotificationDbType.Drug),
                    ),);
                  }
              ),
              Divider(),
              ListTile(
                  title: Text(
                    'add_visit_notification'.tr(),
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  trailing: Icon(
                    Icons.chevron_right,
                    color: Colors.grey,
                  ),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) => NotificationForm(type: NotificationDbType.Visit),
                    ),);
                  }
              ),
              Divider(),
              ListTile(
                  title: Text(
                    'add_analysis_notification'.tr(),
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  trailing: Icon(
                    Icons.chevron_right,
                    color: Colors.grey,
                  ),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) => NotificationForm(type: NotificationDbType.Analysis),
                    ),);
                  }
              ),
              /*CustomButton(
                  text: 'Cancel notification',
                  onPressed: () async {
                    await _cancelNotification();
                  },
                ),
                CustomButton(
                  text: 'Cancel all notifications',
                  onPressed: () async {
                    await _cancelAllNotifications();
                  },
                ),*/
              /*Container(
                  height: MediaQuery.of(context).size.height * 0.6,
                  child: ListView.builder(
                      padding: const EdgeInsets.all(8),
                      itemCount: _list.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          height: 50,
                          color: Colors.amber,
                          child: Center(child: Text('${_list[index].description}')),
                        );
                      }
                  ),
                ),*/
            ],
          ),
        ),
      ),
    );
  }


  Future<void> _cancelNotification() async {
    await flutterLocalNotificationsPlugin.cancel(0);
  }

  Future<void> _cancelAllNotifications() async {
    await flutterLocalNotificationsPlugin.cancelAll();
  }



  List getDayEnums(List list){
    List newList = [];
    for(int i in list){
      if(i == 1){
        newList.add(DateTime.monday);
      }
      else if(i == 2){
        newList.add(DateTime.tuesday);
      }
      else if(i == 2){
        newList.add(DateTime.wednesday);
      }
      else if(i == 2){
        newList.add(DateTime.thursday);
      }
      else if(i == 2){
        newList.add(DateTime.friday);
      }
      else if(i == 2){
        newList.add(DateTime.saturday);
      }
      else if(i == 2){
        newList.add(DateTime.sunday);
      }
    }
    return newList;
  }

  Future<void> _scheduledNotification(String title, String body, DateTime dateTime, NotificationDbTimeType type, int value) async {
    await flutterLocalNotificationsPlugin.zonedSchedule(
        0,
        title,
        body,
        _nextInstanceOfDay(type, value, dateTime),
        const NotificationDetails(
          android: AndroidNotificationDetails(
              'daily notification channel id',
              'daily notification channel name',
              'daily notification description'),
        ),
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation:
        UILocalNotificationDateInterpretation.absoluteTime,
        matchDateTimeComponents: DateTimeComponents.time);
  }

  tz.TZDateTime _nextInstanceOf(DateTime dateTime) {
    tz.TZDateTime now = tz.TZDateTime.now(tz.local);
    tz.TZDateTime scheduledDate =
    tz.TZDateTime(tz.local, dateTime.year, dateTime.month, dateTime.day, dateTime.hour, dateTime.minute);
    if (scheduledDate.isBefore(now)) {
      scheduledDate = scheduledDate.add(const Duration(days: 1));
    }
    return scheduledDate;
  }

  tz.TZDateTime _nextInstanceOfDay(NotificationDbTimeType type, int value, DateTime dateTime) {
    tz.TZDateTime scheduledDate = _nextInstanceOf(dateTime);
    if(type == NotificationDbTimeType.Hour)
      scheduledDate = scheduledDate.subtract(Duration(hours: value));
    if(type == NotificationDbTimeType.Day)
      scheduledDate = scheduledDate.subtract(Duration(days: value));
    if(type == NotificationDbTimeType.Month)
      scheduledDate = scheduledDate.subtract(Duration(days: 30));
    return scheduledDate;
  }
}

class CustomPicker extends CommonPickerModel {
  String digits(int value, int length) {
    return '$value'.padLeft(length, "0");
  }

  CustomPicker({DateTime currentTime, LocaleType locale}) : super(locale: locale) {
    this.currentTime = currentTime ?? DateTime.now();
    this.setLeftIndex(this.currentTime.hour);
    this.setMiddleIndex(this.currentTime.minute);
    this.setRightIndex(this.currentTime.second);
  }

  @override
  String leftStringAtIndex(int index) {
    if (index >= 0 && index < 24) {
      return this.digits(index, 2);
    } else {
      return null;
    }
  }

  @override
  String middleStringAtIndex(int index) {
    if (index >= 0 && index < 60) {
      return this.digits(index, 2);
    } else {
      return null;
    }
  }

  @override
  String rightStringAtIndex(int index) {
    if (index >= 0 && index < 60) {
      return this.digits(index, 2);
    } else {
      return null;
    }
  }

  @override
  String leftDivider() {
    return "|";
  }

  @override
  String rightDivider() {
    return "|";
  }

  @override
  List<int> layoutProportions() {
    return [1, 2, 1];
  }

  @override
  DateTime finalTime() {
    return currentTime.isUtc
        ? DateTime.utc(currentTime.year, currentTime.month, currentTime.day,
        this.currentLeftIndex(), this.currentMiddleIndex(), this.currentRightIndex())
        : DateTime(currentTime.year, currentTime.month, currentTime.day, this.currentLeftIndex(),
        this.currentMiddleIndex(), this.currentRightIndex());
  }
}

class BasicDateTimeField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      DateTimeField(
//        format: format,
        initialValue: DateTime.now(),
        onShowPicker: (context, currentValue) async {
          final date = await showDatePicker(
              context: context,
              firstDate: DateTime(1900),
              initialDate: currentValue ?? DateTime.now(),
              lastDate: DateTime(2100));
          if (date != null) {
            final time = await showTimePicker(
              context: context,
              initialTime:
              TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
            );
            return DateTimeField.combine(date, time);
          } else {
            return currentValue;
          }
        },
      ),
    ]);
  }
}