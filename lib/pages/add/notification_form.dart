import 'package:HIVApp/Enums/select_notification_operation.dart';
import 'package:HIVApp/components/text_form_field.dart';
import 'package:HIVApp/db/notification.dart';
import 'package:HIVApp/utils/constants.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:number_inc_dec/number_inc_dec.dart';
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

class Day {
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

class NotificationForm extends StatefulWidget {
  NotificationDbType type;
  NotificationDb notificationDb;
  final operationType;

  NotificationForm({this.type, this.notificationDb, this.operationType});

  @override
  NotificationFormState createState() => NotificationFormState();
}

class NotificationFormState extends State<NotificationForm> {
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

  final format = DateFormat("yyyy-MM-dd HH:mm");

  Future<void> _configSettings() async {
    await _configureLocalTimeZone();

    notificationAppLaunchDetails =
        await flutterLocalNotificationsPlugin.getNotificationAppLaunchDetails();

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
    final InitializationSettings initializationSettings =
        InitializationSettings(
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

  void _createDays() {
    _day = new Day('За час', NotificationDbTimeType.Hour);
    Day day1 = new Day('За день', NotificationDbTimeType.Day);
    Day day2 = new Day('За месяц', NotificationDbTimeType.Month);

    _days.add(_day);
    _days.add(day1);
    _days.add(day2);
  }

  writeTitle() {
    var titleStr = '';
    var notificationTitleStr = '';
    if (_type == NotificationDbType.Drug) {
      titleStr = 'add_drug_notification';
      notificationTitleStr = 'drug_notification_title';
    } else if (_type == NotificationDbType.Visit) {
      titleStr = 'add_visit_notification';
      notificationTitleStr = 'visit_notification_title';
    } else if (_type == NotificationDbType.Analysis) {
      titleStr = 'add_analysis_notification';
      notificationTitleStr = 'analysis_notification_title';
    }
    setState(() {
      title = titleStr;
      notification_title = notificationTitleStr;
    });
  }

  DateTimeRange dateRange;
  TimeOfDay timeOfDay;
  TextEditingController _pillCountController = TextEditingController();
  TextEditingController _pillController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();

  @override
  void initState() {
    _type = widget.type;
    super.initState();
    _configSettings();
    _requestPermissions();
    _createDays();
    writeTitle();

    if (widget.notificationDb != null) {
      dateRange = DateTimeRange(
          start: widget.notificationDb.startDateTime,
          end: widget.notificationDb.endDateTime);
      timeOfDay = widget.notificationDb.drugTime;
      _pillController =
          TextEditingController(text: widget.notificationDb.drugName);
      _pillCountController = TextEditingController(
          text: widget.notificationDb.drugCount.toString());
      _descriptionController =
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

  static Future<void> scheduledNotification(String title, String body,
      DateTime dateTime, NotificationDbTimeType type, int value) async {
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
    tz.TZDateTime scheduledDate = tz.TZDateTime(tz.local, dateTime.year,
        dateTime.month, dateTime.day, dateTime.hour, dateTime.minute);
    if (scheduledDate.isBefore(now)) {
      scheduledDate = scheduledDate.add(const Duration(days: 1));
    }
    return scheduledDate;
  }

  static tz.TZDateTime _nextInstanceOfDay(
      NotificationDbTimeType type, int value, DateTime dateTime) {
    tz.TZDateTime scheduledDate = _nextInstanceOf(dateTime);
    if (type == NotificationDbTimeType.Hour)
      scheduledDate = scheduledDate.subtract(Duration(hours: value));
    if (type == NotificationDbTimeType.Day)
      scheduledDate = scheduledDate.subtract(Duration(days: value));
    if (type == NotificationDbTimeType.Month)
      scheduledDate = scheduledDate.subtract(Duration(days: 30));
    return scheduledDate;
  }

  /// new scheduled Notifications
  // region new Notifications
  /// Ежедневный уведомитель по времени
  Future<void> scheduleDailyNotification(
      {int id,
      String title,
      String body,
      // DateTimeRange dateTimeRange,
      TimeOfDay timeOfDay}) async {
    // var days = dateRange.end.difference(dateRange.start).inDays;
    // _cancelNotificationAfterDays(id, days);
    return await flutterLocalNotificationsPlugin.zonedSchedule(
        id,
        title,
        body,
        _nextInstanceOfATTime(Time(timeOfDay.hour, timeOfDay.minute)),
        const NotificationDetails(
          android: AndroidNotificationDetails(
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
            UILocalNotificationDateInterpretation.absoluteTime,
        matchDateTimeComponents: DateTimeComponents.time);
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

  tz.TZDateTime _nextInstance(DateTime dateTime, TimeOfDay timeOfDay) {
    final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
    final tzDateTime = tz.TZDateTime.from(dateTime, tz.local);
    var dateTimeDifference = tzDateTime.difference(now).inDays + 1;

    var dateTimeToSet = dateTime.isBefore(now)
        ? tzDateTime.add(Duration(days: dateTimeDifference))
        : tzDateTime;

    tz.TZDateTime scheduledDate = tz.TZDateTime(
        tz.local,
        dateTimeToSet.year,
        dateTimeToSet.month,
        dateTimeToSet.day,
        timeOfDay.hour,
        timeOfDay.minute);
    if (scheduledDate.isBefore(now)) {
      scheduledDate = scheduledDate.add(const Duration(days: 1));
    }
    return scheduledDate;
  }

  /// Через (cancelDayCount) уведомления отменится
  Future<void> _cancelNotificationAfterDays(int id, int cancelDayCount) async {
    Future.delayed(
        Duration(days: cancelDayCount),
        () async => {
              await flutterLocalNotificationsPlugin.cancel(id),
            });
  }

  //endregion

  String getFrom() {
    if (dateRange == null) return "c";
    return DateFormat('MM/dd/yyyy').format(dateRange.start);
  }

  String getUntil() {
    if (dateRange == null) return "до";
    return DateFormat('MM/dd/yyyy').format(dateRange.end);
  }

  /// Метод выбора диапазона дат
  Future pickDateRange(BuildContext context) async {
    final initialDateRange = DateTimeRange(
      start: DateTime.now(),
      end: DateTime.now().add(Duration(hours: 24 * 3)),
    );

    final newDateRange = await showDateRangePicker(
      context: context,
      builder: (BuildContext context, Widget child) {
        return Theme(
          data: ThemeData(primarySwatch: Colors.blue),
          child: child ?? Text(""),
        );
      },
      firstDate: DateTime(DateTime.now().year - 1),
      lastDate: DateTime(DateTime.now().year + 5),
      initialDateRange: dateRange ?? initialDateRange,
    );

    if (newDateRange == null) return;
    setState(() => dateRange = newDateRange);
  }

  /// Виджет диапазона даты
  Widget _dateFromUntil() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        GestureDetector(
          onTap: () => pickDateRange(context),
          child: Container(
            height: 35,
            width: 150,
            child: Center(
                child: Text(getFrom(),
                    style: TextStyle(fontSize: 18, color: Colors.grey))),
            decoration: BoxDecoration(
              color: kLightGrayishBlue,
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        ),
        Icon(Icons.arrow_forward, color: kDesaturatedBlue, size: 18),
        GestureDetector(
          onTap: () => pickDateRange(context),
          child: Container(
            height: 35,
            width: 150,
            child: Center(
                child: Text(getUntil(),
                    style: TextStyle(fontSize: 16, color: Colors.grey))),
            decoration: BoxDecoration(
              color: kLightGrayishBlue,
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        ),
      ],
    );
  }

  /// Время уведомления
  Widget _selectNotificationTime() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text("specify_time".tr(),
              style: TextStyle(color: kDarkGrayishBlue, fontSize: 18)),
          InkWell(
            onTap: () => pickTime(context),
            child: Container(
              height: 35,
              width: 150,
              child: Center(
                  child: Text(getTimeText(),
                      style: TextStyle(fontSize: 16, color: Colors.grey))),
              decoration: BoxDecoration(
                color: kLightGrayishBlue,
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Метод для выбора времени
  Future pickTime(BuildContext context) async {
    DateTime now = DateTime.now();
    final initialTime = TimeOfDay(hour: now.hour, minute: now.minute);
    final newTime = await showTimePicker(
      context: context,
      initialTime: timeOfDay ?? initialTime,
    );
    if (newTime == null) return;
    setState(() => timeOfDay = newTime);
  }

  String getTimeText() {
    final localizations = MaterialLocalizations.of(context);
    var now = DateTime.now();
    if (timeOfDay == null) return "${DateFormat('HH:mm').format(now)}";
    return localizations.formatTimeOfDay(timeOfDay);
  }

  /// Количество таблеток
  Widget _pillCountField() {
    return NumberInputWithIncrementDecrement(
      controller: _pillCountController,
      min: 1,
      max: 1000,
      initialValue: _pillCountController.text.isNotEmpty
          ? int.parse(_pillCountController.text)
          : 1,
      numberFieldDecoration: InputDecoration(
        border: InputBorder.none,
      ),
      widgetContainerDecoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          border: Border.all(
            color: kDesaturatedBlue,
            width: 2,
          )),
      incIconDecoration: BoxDecoration(
        color: kDesaturatedBlue,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10),
          topRight: Radius.circular(8),
        ),
      ),
      separateIcons: true,
      decIconDecoration: BoxDecoration(
        color: kDesaturatedBlue,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10), bottomRight: Radius.circular(8)),
      ),
      incIconColor: kColorWhite,
      decIconColor: kColorWhite,
    );
  }

  Widget dateTimePicker() {
    return Container(
      padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.02),
      width: MediaQuery.of(context).size.width * 0.7,
      child: DateTimeField(
        format: format,
        initialValue: DateTime.now(),
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
    didNotificationLaunchApp =
        notificationAppLaunchDetails?.didNotificationLaunchApp ?? false;
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
                padding: EdgeInsets.only(bottom: 20),
                child: CustomTextFormField(
                  controller: _pillController,
                  hintText: "drug_name".tr(),
                  fillColor: kLightGrayishBlue,
                  focusedBorderColor: kDesaturatedBlue,
                  borderRadius: 8.0,
                  contentPadding: EdgeInsets.only(left: 10, top: 10),
                  validator: (String value) {
                    // if (value.isEmpty) return "fillThisFieldError".tr();
                  },
                ),
              ),

              /// Количество таблеток
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'drug_count'.tr(),
                  style: kInputStyle,
                ),
              ),
              _pillCountField(),
              SizedBox(height: 20),

              /// Дата (С) Дата (До)
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  'date'.tr(),
                  style: kInputStyle,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: _dateFromUntil(),
              ),

              /// Время напоминания

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: _selectNotificationTime(),
              ),

              // /// Напомнить (за час, за день, за месяц)
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: Text(
              //     'notify'.tr(),
              //     style: kInputTextStyle,
              //   ),
              // ),
              // Container(
              //   color: Colors.red,
              //   width: MediaQuery.of(context).size.width*0.5,
              //   padding: const EdgeInsets.all(8.0),
              //   child: DropdownButton<Day>(
              //     isExpanded: true,
              //     hint: Text("date".tr()),
              //     value: _day,
              //     elevation: 16,
              //     style: TextStyle(
              //         color: Colors.deepPurple
              //     ),
              //     underline: Container(
              //       height: 2,
              //       color: Colors.blue,
              //     ),
              //     onChanged: (Day newValue) {
              //       setState(() {
              //         _day = newValue;
              //       });
              //     },
              //     items: _days
              //         .map<DropdownMenuItem<Day>>((Day value) {
              //       return DropdownMenuItem<Day>(
              //         value: value,
              //         child: Text(value.name) ,
              //       );
              //     }).toList(),
              //   ),
              // ),

              /// Описание
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
                  controller: _descriptionController,
                  cursorColor: kDesaturatedBlue,
                  cursorHeight: 30,
                  style: TextStyle(fontSize: 18, decorationColor: Colors.grey),
                  maxLines: 3,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(
                        left: 16, bottom: 11, top: 11, right: 16),
                  ),
                  // onChanged: (value) {
                  //   setState(() {
                  //     _description = value;
                  //   });
                  // },
                ),
                decoration: BoxDecoration(
                    color: kLightGrayishBlue,
                    borderRadius: BorderRadius.circular(8.0)),
              ),

              /// Buttons Cancel && Add
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    child: Text('cancel'.tr(),
                        style: TextStyle(color: kDesaturatedBlue)),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  TextButton(
                    child: Text('add'.tr(),
                        style: TextStyle(color: kDesaturatedBlue)),
                    onPressed: () async {
                      await scheduleDailyNotification(
                        id: _dateTime.millisecond,
                        title: _pillController.text,
                        body: _descriptionController.text,
                        timeOfDay: timeOfDay ?? TimeOfDay(hour: DateTime.now().hour, minute: DateTime.now().minute),
                      ).then((value) async {
                        await NotificationDb.updateOrCreateNotification(
                            NotificationDb(
                                notificationId: widget.operationType ==
                                        Operation.createNotification
                                    ? _dateTime.millisecond
                                    : widget.notificationDb.notificationId,
                                drugCount: int.parse(_pillCountController.text),
                                startDateTime: dateRange.start,
                                endDateTime: dateRange.end,
                                drugName: _pillController.text,
                                drugTime: timeOfDay ??TimeOfDay(hour: DateTime.now().hour, minute: DateTime.now().minute),
                                isActive: 1,
                                description: _descriptionController.text,
                                datetime: _dateTime,
                                time_type: _day.type,
                                type: _type,
                                sent: 0),
                            selectOperation: widget.operationType);
                      });
                      Navigator.pop(context);
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

  CustomPicker({DateTime currentTime, LocaleType locale})
      : super(locale: locale) {
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
        ? DateTime.utc(
            currentTime.year,
            currentTime.month,
            currentTime.day,
            this.currentLeftIndex(),
            this.currentMiddleIndex(),
            this.currentRightIndex())
        : DateTime(
            currentTime.year,
            currentTime.month,
            currentTime.day,
            this.currentLeftIndex(),
            this.currentMiddleIndex(),
            this.currentRightIndex());
  }
}
