import 'dart:async';
import 'dart:ui';

import 'package:HIVApp/Enums/select_notification_operation.dart';
import 'package:HIVApp/db/db_provider.dart';
import 'package:HIVApp/db/notification.dart';
import 'package:HIVApp/pages/add/notification_form.dart';
import 'package:HIVApp/routes/routes.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:easy_localization/easy_localization.dart';
import 'general_notification_form.dart';
import 'image_form.dart';

class AddPage extends StatefulWidget {

  @override
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {

  bool logged = false;

  @override
  initState() {
    isLoggedIn();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
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

  isLoggedIn() async {
    await DBProvider.db.getUserId().then((value) {
      if (value != null)
        setState(() {
          logged = true;
        });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    if (logged) {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) =>
                            NotificationForm(type: NotificationDbType.Drug,
                                operationType: Operation.createNotification),
                      ));
                    } else {
                      _showErrorDialog('login_or_sign_up_to_add'.tr());
                    }
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
              // Divider(),
              // ListTile(
              //     title: Text(
              //       'set_symptom'.tr(),
              //       style: TextStyle(
              //         fontSize: 16,
              //         fontWeight: FontWeight.bold,
              //       ),
              //     ),
              //     trailing: Icon(
              //       Icons.chevron_right,
              //       color: Colors.grey,
              //     ),
              //     onTap: () {
              //       Navigator.push(context, MaterialPageRoute(
              //         builder: (context) => AddSymptomForm(title: 'set_symptom'),
              //       ),);
              //     }
              // ),
              // Divider(),
              // ListTile(
              //     title: Text(
              //       'set_mood'.tr(),
              //       style: TextStyle(
              //         fontSize: 16,
              //         fontWeight: FontWeight.bold,
              //       ),
              //     ),
              //     trailing: Icon(
              //       Icons.chevron_right,
              //       color: Colors.grey,
              //     ),
              //     onTap: () {
              //       Navigator.push(context, MaterialPageRoute(
              //         builder: (context) => AddMoodForm(title: 'set_mood'),
              //       ),);
              //     }
              // ),
              Divider(),
              ListTile(
                  title: Text(
                    'set_image_analysis'.tr(),
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
                    if (logged) {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) =>
                            ImageForm(title: 'set_image_analysis', type: 1,),
                      ));
                    } else {
                      _showErrorDialog('login_or_sign_up_to_add'.tr());
                    }
                  }
              ),
              Divider(),
              ListTile(
                  title: Text(
                    'set_image_recipe'.tr(),
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
                    if (logged) {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) =>
                            ImageForm(title: 'set_image_recipe', type: 2,),
                      ));
                    } else {
                      _showErrorDialog('login_or_sign_up_to_add'.tr());
                    }
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

  List getDayEnums(List list) {
    List newList = [];
    for (int i in list) {
      if (i == 1) {
        newList.add(DateTime.monday);
      }
      else if (i == 2) {
        newList.add(DateTime.tuesday);
      }
      else if (i == 2) {
        newList.add(DateTime.wednesday);
      }
      else if (i == 2) {
        newList.add(DateTime.thursday);
      }
      else if (i == 2) {
        newList.add(DateTime.friday);
      }
      else if (i == 2) {
        newList.add(DateTime.saturday);
      }
      else if (i == 2) {
        newList.add(DateTime.sunday);
      }
    }
    return newList;
  }
}