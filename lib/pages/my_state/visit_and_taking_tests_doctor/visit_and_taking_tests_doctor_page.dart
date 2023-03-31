import 'dart:async';

import 'package:hiv/Enums/select_notification_operation.dart';
import 'package:hiv/components/app_bar_arrow_back.dart';
import 'package:hiv/db/db_provider.dart';
import 'package:hiv/db/notification.dart';
import 'package:hiv/pages/add/add_page.dart';
import 'package:hiv/pages/add/general_notification_form.dart';
import 'package:hiv/routes/routes.dart';
import 'package:hiv/utils/constants.dart';
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
  bool logged = false;

  @override
  void initState() {
    super.initState();
    isLoggedIn();
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

  isLoggedIn() async {
    await DBProvider.db.getUserId().then((value) {
      if (value != null)
        setState(() {
          logged = true;
        });
    });
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
        appBar: ArrowBackAppBar(
          text: "my_condition".tr().toUpperCase(),
          action: InkWell(
            onTap: () {
              if (logged) {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) =>
                      VisitAndAnalyze(),
                ));
              }
            },
            child: Container(
              padding: EdgeInsets.only(right: 16),
              child: Icon(
                Icons.add,
                color: kModerateBlue,
                size: 30,
              ),
            ),
          ),
        ),
        body: notificationList != null || notificationList.isNotEmpty
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


class VisitAndAnalyze extends StatefulWidget {
  const VisitAndAnalyze({Key key}) : super(key: key);

  @override
  _VisitAndAnalyzeState createState() => _VisitAndAnalyzeState();
}

class _VisitAndAnalyzeState extends State<VisitAndAnalyze> {
  bool logged = false;

  @override
  void initState() {
    super.initState();
    isLoggedIn();
  }

  isLoggedIn() async {
    await DBProvider.db.getUserId().then((value) {
      if (value != null)
        setState(() {
          logged = true;
        });
    });
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (ctx) =>
          Center(
            child: AlertDialog(
              title: Text(''),
              content: Text(message),
              actions: <Widget>[
                FlatButton(
                  child: Text('back'.tr()),
                  onPressed: () {
                    Navigator.of(ctx).pop();
                  },
                ),
                FlatButton(
                  child: Text('continue'.tr()),
                  onPressed: () {
                    Navigator.of(ctx).popAndPushNamed(Routes.login);
                  },
                )
              ],
            ),
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: ArrowBackAppBar(
          text: "my_condition".tr().toUpperCase(),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 20),
          color: kLightGrayishBlue,
          child: Center(
            child: ListView(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                      color: Colors.white,
                    borderRadius: BorderRadius.circular(8.0)
                  ),
                  child: ListTile(
                      title: Text(
                        'add_visit_notification'.tr().toUpperCase(),
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: kModerateBlue,
                        ),
                      ),
                      trailing: Icon(
                        Icons.chevron_right,
                        color: kModerateBlue,
                      ),
                      onTap: () {
                        if (logged) {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) =>
                                GeneralNotificationForm(type: NotificationDbType
                                    .Visit),
                          ));
                        } else {
                          _showErrorDialog('login_or_sign_up_to_add'.tr());
                        }
                      }
                  ),
                ),
                Divider(),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.0)
                  ),
                  child: ListTile(
                      title: Text(
                        'add_analysis_notification'.tr().toUpperCase(),
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: kModerateBlue
                        ),
                      ),
                      trailing: Icon(
                        Icons.chevron_right,
                        color: kModerateBlue,
                      ),
                      onTap: () {
                        if (logged) {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) =>
                                GeneralNotificationForm(type: NotificationDbType
                                    .Analysis),
                          ));
                        }
                        else {
                          _showErrorDialog('login_or_sign_up_to_add'.tr());
                        }
                      }
                  ),
                ),
              ],
            ),
          ),
        )
    );
  }
}

