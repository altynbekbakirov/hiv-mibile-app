import 'dart:async';
import 'dart:io';

import 'package:HIVApp/components/app_bar_arrow_back.dart';
import 'package:HIVApp/db/db_provider.dart';
import 'package:HIVApp/db/image_files.dart';
import 'package:HIVApp/db/notification.dart';
import 'package:HIVApp/pages/add/add_page.dart';
import 'package:HIVApp/pages/add/image_form.dart';
import 'package:HIVApp/routes/routes.dart';
import 'package:HIVApp/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class ResultsOfTests extends StatefulWidget {
  const ResultsOfTests({Key key}) : super(key: key);

  @override
  _ResultsOfTestsState createState() => _ResultsOfTestsState();
}

class _ResultsOfTestsState extends State<ResultsOfTests> {
  List<NotificationDb> notificationList = List<NotificationDb>();
  bool status = false;
  final notifications = FlutterLocalNotificationsPlugin();
  List<UserImageFile> userImages = List<UserImageFile>();
  bool logged = false;

  @override
  void initState() {
    super.initState();
    isLoggedIn();
    DBProvider.db.getUserImageFiles().then((value) {
      if (value != null)
        setState(() {
          for (var i in value) {
            userImages.add(i);
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
      builder: (ctx) => Center(
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

  Future onSelectNotification(String payload) async => await Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => AddPage()),
      );

  FutureOr onGoBack(dynamic value) {
    setState(() {});
  }

  void getImages() async {
    await DBProvider.db.getUserImageFiles().then((value) {
      if (value != null)
        setState(() {
          for (var i in value) {
            userImages.add(i);
          }
        });
    });
  }

  /// Card Header
  Widget _name(String name, int imageId, int index) {
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
                  print("$imageId ----------------");
                  await DBProvider.db.deleteUserImage(imageId);
                },
              ),
              GestureDetector(
                onTap: () {
                  // _navigateAndDisplaySelection(context, index);
                  // final result = Navigator.push(
                  //      context,
                  //      MaterialPageRoute(
                  //        builder: (context) => NotificationForm(
                  //          type: NotificationDbType.Drug,
                  //          notificationDb: notificationList[index],
                  //          operationType: Operation.updateNotification,
                  //        ),
                  //      )).then((value){
                  //        if(value)
                  //          setState((){});
                  //      });
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

  void _showDeleteDialog(String message, int id) {
    showDialog(
      context: context,
      builder: (ctx) => Center(
        child: AlertDialog(
          title: Text('delete'.tr()),
          content: Text(message,
              style: TextStyle(
                  color: kVeryDarkGrayishBlue,
                  fontSize: 18,
                  fontWeight: FontWeight.w600)),
          actions: <Widget>[
            FlatButton(
              child: Text('back'.tr().toUpperCase()),
              onPressed: () {
                Navigator.of(ctx).pop();
              },
            ),
            FlatButton(
              child: Text('delete'.tr().toUpperCase()),
              onPressed: () {
                setState(() {
                  DBProvider.db.deleteUserImage(id);
                });
                Navigator.pop(context);
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
          action: InkWell(
            onTap: () {
              if (logged) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DoctorAppointment(),
                    ));
              } else {
                _showErrorDialog('login_or_sign_up_to_add'.tr());
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
        body: userImages != null
            ? Container(
                padding: EdgeInsets.symmetric(vertical: 20),
                color: kLightGrayishBlue,
                child: ListView.builder(
                  itemCount: userImages.length,
                  itemBuilder: (BuildContext context, int index) {
                    return MyItem(
                        userImages: userImages[index],
                        onDelete: () {
                          _showDeleteDialog(
                              "Are you sure", userImages[index].id);
                        });
                  },
                ),
              )
            : Center(
                child: Container(child: Text("there_are_not_results".tr()))));
  }
}

class MyItem extends StatefulWidget {
  final VoidCallback onDelete;
  final UserImageFile userImages;

  MyItem({this.onDelete, this.userImages});

  @override
  _MyItemState createState() => _MyItemState();
}

class _MyItemState extends State<MyItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              widget.userImages.type == 1
                  ? Text("analyze_result".tr().toUpperCase(),
                      style: TextStyle(
                        color: kModerateBlue,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ))
                  : Text("doctor_appointment".tr().toUpperCase(),
                      style: TextStyle(
                        color: kModerateBlue,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      )),
              Align(
                alignment: Alignment.centerRight,
                child: InkWell(
                  onTap: widget.onDelete,
                  child:
                      Icon(Icons.delete_outline, size: 25, color: Colors.black),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Image.file(File(widget.userImages.path)),
          SizedBox(height: 30),
        ],
      ),
    );
  }
}

class DoctorAppointment extends StatefulWidget {
  const DoctorAppointment({Key key}) : super(key: key);

  @override
  _DoctorAppointmentState createState() => _DoctorAppointmentState();
}

class _DoctorAppointmentState extends State<DoctorAppointment> {
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
      builder: (ctx) => Center(
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
                      borderRadius: BorderRadius.circular(8.0)),
                  child: ListTile(
                      title: Text(
                        'set_image_analysis'.tr().toUpperCase(),
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
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ImageForm(
                                  title: 'set_image_analysis',
                                  type: 1,
                                ),
                              ));
                        } else {
                          _showErrorDialog('login_or_sign_up_to_add'.tr());
                        }
                      }),
                ),
                Divider(),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.0)),
                  child: ListTile(
                      title: Text(
                        'set_image_recipe'.tr().toUpperCase(),
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
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ImageForm(
                                  title: 'set_image_recipe',
                                  type: 2,
                                ),
                              ));
                        } else {
                          _showErrorDialog('login_or_sign_up_to_add'.tr());
                        }
                      }),
                ),
              ],
            ),
          ),
        ));
  }
}
