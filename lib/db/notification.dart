import 'dart:convert';
import 'package:hiv/Enums/select_notification_operation.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../data/configs.dart';
import 'package:http/http.dart' as http;
import 'model/user.dart';
import 'db_provider.dart';
import '../pages/add/notification_form.dart';

enum NotificationDbTimeType { Hour, Day, Month }
enum NotificationDbType { Drug, Visit, Analysis }

class NotificationDb {
  int id;
  int notificationId;
  DateTime startDateTime;
  DateTime endDateTime;
  int drugCount;
  String drugName;
  TimeOfDay drugTime;
  int isActive;
  int sent;
  String description;
  DateTime datetime;
  NotificationDbTimeType time_type;
  NotificationDbType type;

  NotificationDb(
      {this.id,
      this.notificationId,
      this.startDateTime,
      this.endDateTime,
      this.drugCount,
      this.drugName,
      this.drugTime,
      this.isActive,
      this.description,
      this.datetime,
      this.time_type,
      this.type,
      this.sent});

  factory NotificationDb.fromJson(Map<String, dynamic> json) {
    NotificationDbTimeType timeType = NotificationDbTimeType.Hour;
    if (json["time_type"].toString == NotificationDbTimeType.Day.toString)
      timeType = NotificationDbTimeType.Day;
    else if (json["time_type"].toString ==
        NotificationDbTimeType.Month.toString)
      timeType = NotificationDbTimeType.Month;

    NotificationDbType dbType = NotificationDbType.Drug;
    if (json["type"].toString() == NotificationDbType.Visit.toString())
      dbType = NotificationDbType.Visit;
    else if (json["type"].toString() == NotificationDbType.Analysis.toString())
      dbType = NotificationDbType.Analysis;
    return new NotificationDb(
        id: json["id"],
        description: json["description"],
        datetime: DateTime.parse(json['datetime']),
        time_type: timeType,
        type: dbType,
        sent: json['sent']);
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "description": description,
        "datetime": datetime.toString(),
        "time_type": time_type.toString(),
        "type": type.toString(),
        "sent": sent
      };

  Map<String, dynamic> toJsonForServer() => {
        "patient_id": id,
        "description": description,
        "datetime": datetime.toString(),
        "remind": convertTimetypeEnumsToString(time_type),
        "type": convertTypeEnumsToString(type),
      };

  static String convertTimetypeEnumsToString(NotificationDbTimeType type) {
    if (type == NotificationDbTimeType.Day)
      return 'day';
    else if (type == NotificationDbTimeType.Hour)
      return 'hour';
    else
      return 'month';
  }

  static String convertTypeEnumsToString(NotificationDbType type) {
    if (type == NotificationDbType.Drug)
      return 'medications';
    else if (type == NotificationDbType.Analysis)
      return 'tests';
    else
      return 'visit';
  }

  static NotificationDbTimeType convertStringToTimetypeEnums(String type) {
    if (type == 'day')
      return NotificationDbTimeType.Day;
    else if (type == 'hour')
      return NotificationDbTimeType.Hour;
    else
      return NotificationDbTimeType.Month;
  }

  static NotificationDbType convertStringToTypeEnums(String type) {
    if (type == 'medications')
      return NotificationDbType.Drug;
    else if (type == 'tests')
      return NotificationDbType.Analysis;
    else
      return NotificationDbType.Visit;
  }

  Future<bool> send() async {
    final url = Configs.ip + 'api/notifications';
    DbUser userDb = await DBProvider.db.getUser();
    try {
      Map<String, String> headers = {"Content-type": "application/json"};
      final response = await http.post(url, headers: headers, body: {
        "data": [
          json.encode({
            "patient_id": userDb.id,
            "description": description,
            "datetime": datetime.toString(),
            "remind": convertTimetypeEnumsToString(time_type),
            "type": convertTypeEnumsToString(type),
          })
        ],
      });
      var rr = json.decode(response.body);
      return true;
    } catch (error) {
      throw error;
    }
  }

  static Future<bool> sendList(List<NotificationDb> list, {int user_id}) async {
    final url = Configs.ip + 'api/notifications';
    bool userExists = false;
    DbUser userDb = new DbUser();
    try {
      userDb = await DBProvider.db.getUser();
      userExists = true;
    } catch (error) {
      throw error;
    }
    try {
      Map<String, String> headers = {"Content-type": "application/json"};
      final response = await http.post(
        url,
        headers: headers,
        body: json.encode(
            {"data": notificationList(list, userExists ? userDb.id : user_id)}),
      );
      var rr = json.decode(response.body);
      return true;
    } catch (error) {
      throw error;
    }
  }

  /// Выбор операции
  static updateOrCreateNotification(NotificationDb model, {selectOperation}) async {
      if(selectOperation == Operation.createNotification)
        sendNotificationList(model);
      if(selectOperation == Operation.updateNotification)
        updateNotification(model);
  }

  /// Сохранить уведомления
  static Future<NotificationDb> sendNotificationList(NotificationDb model,
      {int user_id}) async {
    final url = Configs.ip + 'api/notifications';
    bool userExists = false;
    DbUser userDb = new DbUser();
    try {
      userDb = await DBProvider.db.getUser();
      userExists = true;
    } catch (error) {
      throw error;
    }
    try {
      Map<String, String> headers = {"Content-type": "application/json"};
      final response = await http.post(
        url,
        headers: headers,
        body: json.encode({
          "data": [
            {
              "patient_id": userExists ? userDb.id : user_id,
              "notificationId": model.notificationId,
              "drug_name": model.drugName,
              "drug_count": model.drugCount,
              "drug_time": "${model.drugTime.hour}:${model.drugTime.minute}",
              "startDateTime": model.startDateTime.toString(),
              "endDateTime": model.endDateTime.toString(),
              "isAcive": model.isActive,
              "type": convertTypeEnumsToString(model.type),
              "datetime": model.datetime.toString(),
              "remind": convertTimetypeEnumsToString(model.time_type),
              "description": model.description,
            }
          ]
        }),
      );

      NotificationDb notification = NotificationDb();
      var data = await json.decode(response.body);

      notification.id = data['patient_id'];
      notification.notificationId = data['notificationId'];
      notification.drugName = data['drug_name'];
      notification.drugTime = TimeOfDay(hour: int.parse(data['drug_time'].split(":")[0]), minute: int.parse(data['drug_time'].split(":")[1]));
      notification.drugCount = data['drug_count'];
      notification.isActive = data['isAcive'];
      notification.startDateTime = DateFormat("dd-MM-yyyy").parse((data['startDateTime']));
      notification.endDateTime = DateFormat("dd-MM-yyyy").parse((data['endDateTime']));
      notification.type = convertStringToTypeEnums(data['type']);
      notification.datetime = DateFormat("dd-MM-yyyy").parse((data['datetime']));
      notification.time_type = convertStringToTimetypeEnums(data['remind']);
      notification.description = data['description'];

      return notification;
    } catch (error) {
      throw error;
    }
  }

  /// Получить уведомления
  static Future<List<NotificationDb>> getNotificationsById() async {
    var result = await DBProvider.db.getUser().then((value) async {
      final url = Configs.ip + 'api/notifications/' + value.id.toString();
      try {
        Map<String, String> headers = {
          "Content-type": "application/json",
          "token": value.token
        };
        final response = await http.get(
          url,
          headers: headers,
        );

        List<NotificationDb> list = List<NotificationDb>();
        var data = await json.decode(response.body);
        for(var i in data){
          list.add(
            NotificationDb(
                id: i['patient_id'],
                notificationId: i['notificationId'],
                drugName: i['drug_name'],
                drugTime: i['drug_time'] != ""
                    ? TimeOfDay(hour: int.parse(i['drug_time'].split(":")[0]), minute: int.parse(i['drug_time'].split(":")[1]))
                    : TimeOfDay(hour: 0, minute: 0),
                drugCount: i['drug_count'],
                isActive: i['isAcive'],
                startDateTime: i['startDateTime'] == ""
                    ? null
                    : DateTime.parse((i['startDateTime'])),
                endDateTime: i['endDateTime'] == ""
                    ? null
                    : DateTime.parse((i['endDateTime'])),
                type: convertStringToTypeEnums(i['type']),
                datetime: DateTime.parse((i['datetime'])),
                time_type: convertStringToTimetypeEnums(i['remind']),
                description: i['description']
            )
          );
        }
        return list;
      } catch (error) {
        throw error;
      }
    });
    return result;
  }

  /// Обновить уведомление
  static Future<void> updateNotification(NotificationDb model) async {
    var userDb = await DBProvider.db.getUser();
    final url = Configs.ip + 'api/notifications/update/' + userDb.id.toString();
    try {
      Map<String, String> headers = {"Content-type": "application/json"};
      final response = await http.post(
        url,
        headers: headers,
        body: json.encode({
          "patient_id": userDb.id,
          "notificationId": model.notificationId,
          "drug_name": model.drugName,
          "drug_count": model.drugCount,
          "drug_time": "${model.drugTime.hour}:${model.drugTime.minute}",
          "startDateTime": model.startDateTime.toString(),
          "endDateTime": model.endDateTime.toString(),
          "isAcive": model.isActive,
          "type": convertTypeEnumsToString(model.type),
          "datetime": model.datetime.toString(),
          "remind": convertTimetypeEnumsToString(model.time_type),
          "description": model.description,
        }),
      );
    } catch (error) {
      throw error;
    }
  }

  /// Обновить статус уведомления
  static Future<void> updateNotificationStatus(int notificationId, bool isActive) async {
    var userDb = await DBProvider.db.getUser();
    final url = Configs.ip + 'api/notifications/updateStatus/' + userDb.id.toString();
    try {
      Map<String, String> headers = {"Content-type": "application/json"};
      final response = await http.post(
        url,
        headers: headers,
        body: json.encode({
          "notificationId": notificationId,
          "isAcive": isActive,
        }),
      );
    } catch (error) {
      throw error;
    }
  }

  /// Удалить уведомление
  static Future<List<NotificationDb>> deleteNotification(int notificationId) async {
    var userDb = await DBProvider.db.getUser();
    final url = Configs.ip + 'api/notifications/delete/' + userDb.id.toString();
    try {
      Map<String, String> headers = {"Content-type": "application/json"};
      final response = await http.post(
        url,
        headers: headers,
        body: json.encode({"notificationId":  notificationId}),
      );
      List<NotificationDb> list = List<NotificationDb>();
      var data = await json.decode(response.body);
      for(var i in data){
        list.add(
            NotificationDb(
                id: i['patient_id'],
                notificationId: i['notificationId'],
                drugName: i['drug_name'],
                drugTime: TimeOfDay(hour: int.parse(i['drug_time'].split(":")[0]), minute: int.parse(i['drug_time'].split(":")[1])),
                drugCount: i['drug_count'],
                isActive: i['isAcive'],
                startDateTime: DateTime.parse((i['startDateTime'])),
                endDateTime: DateTime.parse((i['endDateTime'])),
                type: convertStringToTypeEnums(i['type']),
                datetime: DateTime.parse((i['datetime'])),
                time_type: convertStringToTimetypeEnums(i['remind']),
                description: i['description']
            )
        );
      }
      return list;
    } catch (error) {
      throw error;
    }
  }

  static Future<bool> getList() async {
    await DBProvider.db.getUser().then((value) async {
      final url = Configs.ip + 'api/notifications/' + value.id.toString();
      try {
        Map<String, String> headers = {
          "Content-type": "application/json",
          "token": value.token
        };
        final response = await http.get(
          url,
          headers: headers,
        );
        var rr = saveListToDatabase(json.decode(response.body));
        return true;
      } catch (error) {
        throw error;
      }
    });
  }

  static List<NotificationDb> saveListToDatabase(var responseBody) {
    List<NotificationDb> list = new List<NotificationDb>();
    for (var i in responseBody) {
      NotificationDb model = new NotificationDb();

      model.datetime = DateTime.parse(i['datetime']);
      model.description = i['description'];
      model.type = convertStringToTypeEnums(i['type']);
      model.time_type = convertStringToTimetypeEnums(i['remind']);
      model.sent = 1;

      DBProvider.db.newNotification1(model);
      var notificationTitleStr = 'analysis_notification_title';
      if (model.type == NotificationDbType.Drug) {
        notificationTitleStr = 'drug_notification_title';
      } else if (model.type == NotificationDbType.Visit) {
        notificationTitleStr = 'visit_notification_title';
      }
      NotificationFormState.scheduledNotification(notificationTitleStr.tr(),
          model.description, model.datetime, model.time_type, 1);
      list.add(model);
    }
    return list;
  }

  static List<Map<String, dynamic>> notificationList(
      List<NotificationDb> list, int user_id) {
    List<Map<String, dynamic>> result = new List<Map<String, dynamic>>();
    for (var i in list) {
      result.add({
        "patient_id": user_id,
        "notificationId": DateTime.now().millisecond,
        "drug_name": DrugName(i.type),
        "drug_count": 1,
        "drug_time":"17:57",
        "startDateTime":"2020-11-10 15:45",
        "endDateTime":"2020-11-10 15:45",
        "isAcive": 1,
        "description": i.description,
        "datetime": i.datetime.toString(),
        "remind": convertTimetypeEnumsToString(i.time_type),
        "type": convertTypeEnumsToString(i.type),
      });
    }
    return result;
  }

  static String DrugName(NotificationDbType type) {
    if (type == NotificationDbType.Visit)
      return 'Визит к врачу';
    else if (type == NotificationDbType.Analysis)
      return 'Анализ';
    else
      return '';
  }
}



NotificationDb notificationFromJson(String str) {
  final jsonData = json.decode(str);
  return NotificationDb.fromJson(jsonData);
}

String notificationToJson(NotificationDb data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}
