import 'package:hiv/components/text_form_field.dart';
import 'package:hiv/db/db_provider.dart';
import 'package:hiv/db/notification.dart';
import 'package:hiv/utils/constants.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/services.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rxdart/rxdart.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
FlutterLocalNotificationsPlugin();

/// Streams are created so that app can respond to notification-related events
/// since the plugin is initialised in the `main` function
final BehaviorSubject<ReceivedNotification> didReceiveLocalNotificationSubject =
BehaviorSubject<ReceivedNotification>();

final BehaviorSubject<String> selectNotificationSubject =
BehaviorSubject<String>();

const MethodChannel platform =
MethodChannel('dexterx.dev/flutter_local_notifications_example');

class Day{
  final String name;
  final NotificationDbTimeType type;

  Day(this.name, this.type);
}

class ReceivedNotification {
  ReceivedNotification({
    @required this.id,
    @required this.title,
    @required this.body,
    @required this.payload,
  });

  final int id;
  final String title;
  final String body;
  final String payload;
}

class GeneralNotificationForm extends StatefulWidget {
  NotificationDbType type;
  NotificationDb notificationDb;
  final operationType;

  GeneralNotificationForm({this.type, this.notificationDb, this.operationType});

  @override
  GeneralNotificationFormState createState() => GeneralNotificationFormState();
}

class GeneralNotificationFormState extends State<GeneralNotificationForm> {

  NotificationAppLaunchDetails notificationAppLaunchDetails;
  bool didNotificationLaunchApp;
  DateTime _dateTime = new DateTime.now();
  Day _day;
  List<Day> _days = new List<Day>();
  String _description = '';
  NotificationDbType _type;
  String title;
  String notification_title = 'Получение препарата';
  TextStyle kInputStyle = TextStyle(
      fontSize: 16, color: kDarkGrayishBlue, fontWeight: FontWeight.w600);

  TextEditingController descriptionController = TextEditingController();


  final format = DateFormat("yyyy-MM-dd HH:mm");

  Future<void> _configSettings() async {

    await _configureLocalTimeZone();

    notificationAppLaunchDetails = await flutterLocalNotificationsPlugin.getNotificationAppLaunchDetails();

    const AndroidInitializationSettings initializationSettingsAndroid =
    AndroidInitializationSettings('app_icon');

    /// Note: permissions aren't requested here just to demonstrate that can be
    /// done later
    final IOSInitializationSettings initializationSettingsIOS =
    IOSInitializationSettings(
        requestAlertPermission: false,
        requestBadgePermission: false,
        requestSoundPermission: false,
        onDidReceiveLocalNotification:
            (int id, String title, String body, String payload) async {
          didReceiveLocalNotificationSubject.add(ReceivedNotification(
              id: id, title: title, body: body, payload: payload));
        });
    const MacOSInitializationSettings initializationSettingsMacOS =
    MacOSInitializationSettings(
        requestAlertPermission: false,
        requestBadgePermission: false,
        requestSoundPermission: false);
    final InitializationSettings initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid,
        iOS: initializationSettingsIOS,
        macOS: initializationSettingsMacOS);
    await flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: (String payload) async {
          if (payload != null) {
            debugPrint('notification payload: $payload');
          }
          selectNotificationSubject.add(payload);
        });
  }

  Future<void> _configureLocalTimeZone() async {
    tz.initializeTimeZones();
    final String timeZoneName = await FlutterNativeTimezone.getLocalTimezone();
    tz.setLocalLocation(tz.getLocation(timeZoneName));
  }

  void _requestPermissions() {
    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
        IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
      alert: true,
      badge: true,
      sound: true,
    );
    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
        MacOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
      alert: true,
      badge: true,
      sound: true,
    );
  }

  void _createDays(){
    _day = new Day('За час', NotificationDbTimeType.Hour);
    Day day1 = new Day('За день', NotificationDbTimeType.Day);
    Day day2 = new Day('За месяц', NotificationDbTimeType.Month);

    _days.add(_day);
    _days.add(day1);
    _days.add(day2);
  }

  writeTitle(){
    var titleStr = '';
    var notificationTitleStr = '';
    if(_type == NotificationDbType.Drug){
      titleStr = 'add_drug_notification';
      notificationTitleStr = 'drug_notification_title';
    }
    else if(_type == NotificationDbType.Visit){
      titleStr = 'add_visit_notification';
      notificationTitleStr = 'visit_notification_title';
    }
    else if(_type == NotificationDbType.Analysis){
      titleStr = 'add_analysis_notification';
      notificationTitleStr = 'analysis_notification_title';
    }
    setState(() {
      title = titleStr;
      notification_title = notificationTitleStr;
    });
  }

  @override
  void initState() {
    _type = widget.type;
    super.initState();
    _configSettings();
    _requestPermissions();
    _createDays();
    writeTitle();

    if (widget.notificationDb != null) {
      _dateTime = widget.notificationDb.datetime;

      descriptionController =
          TextEditingController(text: widget.notificationDb.description);
    }
  }

  @override
  void dispose() {
    super.dispose();
    didReceiveLocalNotificationSubject.close();
    selectNotificationSubject.close();
  }

  static Future<void> cancelNotification(int id) async {
    await flutterLocalNotificationsPlugin.cancel(id);
  }

  static Future<void> cancelAllNotifications() async {
    await flutterLocalNotificationsPlugin.cancelAll();
  }

  static Future<void> scheduledNotification(String title, String body, DateTime dateTime, NotificationDbTimeType type, int value) async {
    await flutterLocalNotificationsPlugin.zonedSchedule(
        dateTime.millisecond,
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

  static tz.TZDateTime _nextInstanceOf(DateTime dateTime) {
    tz.TZDateTime now = tz.TZDateTime.now(tz.local);
    tz.TZDateTime scheduledDate =
    tz.TZDateTime(tz.local, dateTime.year, dateTime.month, dateTime.day, dateTime.hour, dateTime.minute);
    if (scheduledDate.isBefore(now)) {
      scheduledDate = scheduledDate.add(const Duration(days: 1));
    }
    return scheduledDate;
  }

  static tz.TZDateTime _nextInstanceOfDay(NotificationDbTimeType type, int value, DateTime dateTime) {
    tz.TZDateTime scheduledDate = _nextInstanceOf(dateTime);
    if(type == NotificationDbTimeType.Hour)
      scheduledDate = scheduledDate.subtract(Duration(hours: value));
    if(type == NotificationDbTimeType.Day)
      scheduledDate = scheduledDate.subtract(Duration(days: value));
    if(type == NotificationDbTimeType.Month)
      scheduledDate = scheduledDate.subtract(Duration(days: 30));
    return scheduledDate;
  }

  Widget dateTimePicker() {
    return Container(
      padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.02),
      width: MediaQuery.of(context).size.width * 0.7,
      child: DateTimeField(
        format: format,
        initialValue: _dateTime,
        resetIcon: Icon(FontAwesomeIcons.calendarAlt),
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
            setState(() {
              _dateTime = DateTime(
                  date.year, date.month, date.day, time.hour, time.minute);
            });
            return DateTimeField.combine(date, time);
          } else {
            return currentValue;
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    NotificationAppLaunchDetails notificationAppLaunchDetails;
    didNotificationLaunchApp = notificationAppLaunchDetails?.didNotificationLaunchApp ?? false;
    return Scaffold(
      appBar: AppBar(
        title: Text(title.tr()),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'time'.tr(),
                  style: kInputStyle,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: dateTimePicker(),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  'notify'.tr(),
                  style: kInputStyle,
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.5,
                padding: const EdgeInsets.all(8.0),
                child: DropdownButton<Day>(
                  isExpanded: true,
                  hint: Text("date".tr()),
                  value: _day,
                  elevation: 16,
                  style: TextStyle(
                      color: Colors.deepPurple
                  ),
                  underline: Container(
                    height: 2,
                    color: Colors.blue,
                  ),
                  onChanged: (Day newValue) {
                    setState(() {
                      _day = newValue;
                    });
                  },
                  items: _days
                      .map<DropdownMenuItem<Day>>((Day value) {
                    return DropdownMenuItem<Day>(
                      value: value,
                      child: Text(value.name, style: TextStyle(color: kDesaturatedBlue, fontSize: 16)) ,
                    );
                  }).toList(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'description'.tr(),
                  style: kInputStyle,
                ),
              ),
              Container(
                height: 100,
                child: TextField(
                  controller: descriptionController,
                  cursorColor: kDesaturatedBlue,
                  cursorHeight: 30,
                  style: TextStyle(fontSize: 18, decorationColor: Colors.grey),
                  maxLines: 3,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(
                        left: 16, bottom: 11, top: 11, right: 16),
                  ),
                  onChanged: (value) {
                    setState(() {
                      _description = value;
                    });
                  },
                ),
                decoration: BoxDecoration(
                    color: kLightGrayishBlue,
                    borderRadius: BorderRadius.circular(8.0)),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    child: Text('cancel'.tr()),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  TextButton(
                    child: Text('add'.tr()),
                    onPressed: () {
                      scheduledNotification(notification_title.tr(), _description, _dateTime, _day.type, 1)
                          .then((value) async {
                        await DBProvider.db.newNotification(
                            NotificationDb(description: _description, datetime: _dateTime, time_type: _day.type, type: _type, sent: 0));
                        }
                      );
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
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