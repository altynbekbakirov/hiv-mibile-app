import 'dart:async';

import 'package:HIVApp/Enums/select_notification_operation.dart';
import 'package:HIVApp/components/app_bar_arrow_back.dart';
import 'package:HIVApp/db/notification.dart';
import 'package:HIVApp/pages/add/add_page.dart';
import 'package:HIVApp/pages/add/general_notification_form.dart';
import 'package:HIVApp/utils/constants.dart';
import 'package:custom_switch/custom_switch.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class VisitAndTakingTestDoctorView extends StatefulWidget {
  const VisitAndTakingTestDoctorView({Key key}) : super(key: key);

  @override
  _VisitAndTakingTestDoctorViewState createState() =>
      _VisitAndTakingTestDoctorViewState();
}

class _VisitAndTakingTestDoctorViewState
    extends State<VisitAndTakingTestDoctorView> {
  List<NotificationDb> notificationList = List<NotificationDb>();
  bool status = false;
  final notifications = FlutterLocalNotificationsPlugin();

  @override
  void initState() {
    super.initState();
    NotificationDb.getNotificationsById().then((value) {
      setState(() {
        for (var i in value) {
          if (i.type != NotificationDbType.Drug) notificationList.add(i);
        }
      });
    });

    final settingsAndroid = AndroidInitializationSettings('app_icon');
    final settingsIOS = IOSInitializationSettings(
        onDidReceiveLocalNotification: (id, title, body, payload) =>
            onSelectNotification(payload));

    notifications.initialize(
        InitializationSettings(android: settingsAndroid, iOS: settingsIOS),
        onSelectNotification: onSelectNotification);
  }

  tz.TZDateTime _nextInstanceOfATTime(Time time) {
    final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
    tz.TZDateTime scheduledDate = tz.TZDateTime(
        tz.local, now.year, now.month, now.day, time.hour, time.minute);
    if (scheduledDate.isBefore(now)) {
      scheduledDate = scheduledDate.add(const Duration(days: 1));
    }
    return scheduledDate;
  }

  Future onSelectNotification(String payload) async => await Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => AddPage()),
      );

  FutureOr onGoBack(dynamic value) {
    setState(() {});
  }

  _navigateAndDisplaySelection(BuildContext context, int index) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
          builder: (context) => GeneralNotificationForm(
                type: notificationList[index].type,
                notificationDb: notificationList[index],
                operationType: Operation.updateNotification,
              )),
    );
  }

  /// Card Header
  Widget _name(String name, int notificationId, int index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(name,
            style: TextStyle(
                fontSize: 24,
                color: Colors.black,
                fontWeight: FontWeight.w700)),
        Container(
          width: 72,
          height: 28,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              GestureDetector(
                child: Icon(Icons.delete_outline,
                    size: 20, color: kVeryDarkGrayishBlue),
                onTap: () async {
                  await notifications.cancel(notificationId);
                  await NotificationDb.deleteNotification(notificationId)
                      .then((value) {
                    setState(() {
                      notificationList = value.toList();
                    });
                  });
                },
              ),
              GestureDetector(
                onTap: () {
                  _navigateAndDisplaySelection(context, index);
                },
                child: Icon(Icons.edit_outlined,
                    size: 20, color: kVeryDarkGrayishBlue),
              ),
            ],
          ),
          decoration: BoxDecoration(
              color: kLightGrayishBlue, borderRadius: BorderRadius.circular(8)),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: ArrowBackAppBar(text: "my_condition".tr().toUpperCase()),
        body: notificationList != null
            ? Container(
                padding: EdgeInsets.symmetric(vertical: 20),
                color: kLightGrayishBlue,
                child: ListView.builder(
                  itemCount: notificationList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      height: 226,
                      child: Card(
                        color: kColorWhite,
                        child: Container(
                          margin: EdgeInsets.all(16),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                child: _name(
                                    notificationList[index].drugName,
                                    notificationList[index].notificationId,
                                    index),
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                child: Text(notificationList[index].description,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16)),
                              ),
                              Container(
                                child: Text(
                                  "${DateFormat('MM/dd/yyyy').format(notificationList[index].datetime)}",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                child: Row(
                                  children: <Widget>[
                                    notificationList[index].type ==
                                            NotificationDbType.Drug
                                        ? Text(
                                            "Ежедневно",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          )
                                        : Text(
                                            "Время",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16),
                                      child: Container(
                                        alignment: Alignment.center,
                                        width: 48,
                                        height: 24,
                                        child: Text(
                                            "${notificationList[index].datetime.hour}:${notificationList[index].datetime.minute}"),
                                        decoration: BoxDecoration(
                                          color: kSoftCyan,
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: 60,
                                alignment: Alignment.centerLeft,
                                child: Row(
                                  children: [
                                    CustomSwitch(
                                      activeColor: kDesaturatedBlue,
                                      value:
                                          notificationList[index].isActive == 1,
                                      onChanged: (value) async {
                                        NotificationDb.updateNotificationStatus(
                                            notificationList[index]
                                                .notificationId,
                                            value);
                                        NotificationDb.updateNotificationStatus(
                                            notificationList[index]
                                                .notificationId,
                                            value);
                                        if (value) {
                                          notifications.zonedSchedule(
                                              notificationList[index]
                                                  .notificationId,
                                              notificationList[index].drugName,
                                              notificationList[index]
                                                  .description,
                                              _nextInstanceOfATTime(Time(
                                                  notificationList[index]
                                                      .drugTime
                                                      .hour,
                                                  notificationList[index]
                                                      .drugTime
                                                      .minute)),
                                              const NotificationDetails(
                                                android:
                                                    AndroidNotificationDetails(
                                                  'daily notification channel id',
                                                  'daily notification channel name',
                                                  'daily notification description',
                                                  priority: Priority.high,
                                                  importance: Importance.max,
                                                ),
                                                iOS: IOSNotificationDetails(),
                                              ),
                                              androidAllowWhileIdle: true,
                                              uiLocalNotificationDateInterpretation:
                                                  UILocalNotificationDateInterpretation
                                                      .absoluteTime,
                                              matchDateTimeComponents:
                                                  DateTimeComponents.time);
                                        }
                                        if (!value)
                                          await notifications.cancel(
                                              notificationList[index]
                                                  .notificationId);
                                        setState(() {
                                          status = value;
                                        });
                                      },
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 16),
                                      child: Text("notification".tr(),
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 18,
                                              color: Colors.black)),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              )
            : Center(
                child: Container(child: Text("no_active_notifications".tr()))));
  }
}
