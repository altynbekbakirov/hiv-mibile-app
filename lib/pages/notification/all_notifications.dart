import 'package:hiv/Enums/select_notification_operation.dart';
import 'package:hiv/db/notification.dart';
import 'package:hiv/pages/add/add_page.dart';
import 'package:hiv/pages/add/general_notification_form.dart';
import 'package:hiv/pages/add/notification_form.dart';
import 'package:hiv/utils/constants.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class AllNotifications extends StatefulWidget {
  const AllNotifications({Key key}) : super(key: key);

  @override
  _AllNotificationsState createState() => _AllNotificationsState();
}

class _AllNotificationsState extends State<AllNotifications> {
  final listKey = GlobalKey();
  List<NotificationDb> notificationList = List<NotificationDb>();
  final notifications = FlutterLocalNotificationsPlugin();

  @override
  void initState() {
    super.initState();
    getNotifications();
    final settingsAndroid = AndroidInitializationSettings('app_icon');
    final settingsIOS = IOSInitializationSettings(
        onDidReceiveLocalNotification: (id, title, body, payload) =>
            onSelectNotification(payload));

    notifications.initialize(
        InitializationSettings(android: settingsAndroid, iOS: settingsIOS),
        onSelectNotification: onSelectNotification);
  }

  Future onSelectNotification(String payload) async => await Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => AddPage()),
      );

  void getNotifications() async {
    NotificationDb.getNotificationsById().then((value) async {
      setState(() {
        for (var i in value) {
          notificationList.add(i);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kLightGrayishBlue,
      body: notificationList != null
          ? Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: ListView.builder(
                key: listKey,
                itemCount: notificationList.length,
                itemBuilder: (context, index) {
                  return buildItem(index);
                },
              ),
            )
          : Container(
              child: Center(child: Text("there_are_not_notifications".tr())),
            ),
    );
  }

  Widget buildItem(int index) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12), color: Colors.white),
      child: Container(
        height: 200,
        child: Card(
          color: Colors.white,
          margin: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _cardHeader(index),
              _description(index),
              notificationList[index].type == NotificationDbType.Drug
                  ? _dateTime(index)
                  : Text(
                      "${DateFormat('MM/dd/yyyy').format(notificationList[index].datetime)}",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
              _time(index)
            ],
          ),
        ),
      ),
    );
  }

  /// Card Header
  Widget _cardHeader(int index) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
              notificationList[index].type == NotificationDbType.Drug
                  ? notificationList[index].drugName
                  : notificationList[index].type == NotificationDbType.Analysis
                      ? "analyzes".tr()
                      : "doctor_visit".tr(),
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
                  child: Icon(
                    Icons.delete_outline,
                    size: 20,
                    color: kVeryDarkGrayishBlue,
                  ),
                  onTap: () async {
                    await notifications
                        .cancel(notificationList[index].notificationId);
                    await NotificationDb.deleteNotification(
                            notificationList[index].notificationId)
                        .then((value) {
                      setState(() {
                        notificationList = value.toList();
                      });
                    });
                  },
                ),
                GestureDetector(
                  onTap: () {
                    _navigateAndDisplaySelection(
                        context, index, notificationList[index].type);
                  },
                  child: Icon(Icons.edit_outlined,
                      size: 20, color: kVeryDarkGrayishBlue),
                ),
              ],
            ),
            decoration: BoxDecoration(
              color: kLightGrayishBlue,
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ],
      ),
    );
  }

  _navigateAndDisplaySelection(
      BuildContext context, int index, NotificationDbType type) {
    if (type == NotificationDbType.Drug) {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => NotificationForm(
              type: NotificationDbType.Drug,
              notificationDb: notificationList[index],
              operationType: Operation.updateNotification,
            ),
          )).then((value) {
        if (value) setState(() {});
      });
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => GeneralNotificationForm(
            type: notificationList[index].type,
            notificationDb: notificationList[index],
            operationType: Operation.updateNotification,
          ),
        ),
      );
    }
  }

  /// Description or Text
  Widget _description(int index) {
    return Container(
      child: notificationList[index].type == NotificationDbType.Drug
          ? Text(
              notificationList[index].drugCount == 1
                  ? "tablet".tr() + " ${notificationList[index].drugCount}"
                  : "tablets".tr() + " ${notificationList[index].drugCount}",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 16),
            )
          : Text(
              notificationList[index].description,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 16),
            ),
    );
  }

  /// Date
  Widget _dateTime(int index) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Text(
        "${DateFormat('MM/dd/yyyy').format(notificationList[index].startDateTime)}-${DateFormat('MM/dd/yyyy').format(notificationList[index].endDateTime)}",
        style: TextStyle(
            fontSize: 18, fontWeight: FontWeight.w400, color: Colors.black),
      ),
    );
  }

  Widget _time(int index) {
    return Container(
      child: Row(
        children: <Widget>[
          Text(
            "daily".tr(),
            style: TextStyle(
                color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              alignment: Alignment.center,
              width: 48,
              height: 24,
              child: notificationList[index].type == NotificationDbType.Drug
                  ? Text(
                      "${notificationList[index].drugTime.hour}:${notificationList[index].drugTime.minute}")
                  : Text(
                      "${DateFormat('hh:mm').format(notificationList[index].datetime)}",
                      style: TextStyle(fontSize: 14, color: Colors.black)),
              decoration: BoxDecoration(
                  color: kSoftCyan, borderRadius: BorderRadius.circular(8)),
            ),
          ),
        ],
      ),
    );
  }
}
