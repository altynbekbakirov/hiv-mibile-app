import 'dart:convert';
import 'package:hiv/data/configs.dart';
import 'package:http/http.dart' as http;

import 'db_provider.dart';
import 'model/user.dart';

class UserMood {
  int id;
  int sent;
  int user_id;
  String title;
  String file_name;
  DateTime date_time;

  UserMood(
      {this.id,
      this.user_id,
      this.title,
      this.file_name,
      this.date_time,
      this.sent});

   static UserMood fromJson(Map<String, dynamic> json) => UserMood(
      id: json["id"],
      user_id: json["user_id"],
      title: json["title"],
      file_name: json["file_name"],
      date_time: DateTime.parse(json["date_time"]),
      sent: json['sent']);

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": user_id,
        "title": title,
        "file_name": file_name,
        "date_time": date_time.toString(),
        "sent": sent
      };

  Map<String, dynamic> toJsonForServer() => {
        "patient_id": user_id,
        "title": title,
        "file_name": file_name,
        "date": date_time,
      };

  Future<bool> get() async {
    final url = Configs.ip + 'api/patientmoods';
    DbUser userDb = await DBProvider.db.getUser();
    try {
      Map<String, String> headers = {"Content-type": "application/json"};
      final response = await http.post(
        url,
        headers: headers,
        body: json.encode({
          "patient_id": userDb.id,
          "title": title,
          "file_name": file_name,
          "date": date_time,
        }),
      );
      var rr = json.decode(response.body);
      return true;
    } catch (error) {
      throw error;
    }
  }

  static Future<bool> sendList(List<UserMood> list, int user_id) async {
    final url = Configs.ip + 'api/patientmoods';
    try {
      Map<String, String> headers = {"Content-type": "application/json"};
      await http.post(
        url,
        headers: headers,
        body: json.encode({"data": userMoodList(list, user_id)}),
      );
      return true;
    } catch (error) {
      throw error;
    }
  }

  static Future<bool> getList() async {
    await DBProvider.db.getUser().then((value) async {
      final url = Configs.ip + 'api/patientmoods/' + value.id.toString();
      try {
        Map<String, String> headers = {
          "Content-type": "application/json",
          "token": value.token
        };
        final response = await http.get(
          url,
          headers: headers,
        );
        saveListToDatabase(json.decode(response.body));
        return true;
      } catch (error) {
        throw error;
      }
    });
  }

  static List<UserMood> saveListToDatabase(var responseBody) {
    List<UserMood> list = new List<UserMood>();
    for (var i in responseBody) {
      UserMood model = new UserMood();

      model.user_id = i['patient_id'];
      model.title = i['title'];
      model.file_name = i['file_name'];
      model.date_time = DateTime.parse(i['date']);
      model.sent = 1;

      DBProvider.db.newUserMood1(model);
      list.add(model);
    }
    return list;
  }

  static List<Map<String, dynamic>> userMoodList(
      List<UserMood> list, int userId) {
    List<Map<String, dynamic>> result = new List<Map<String, dynamic>>();
    for (var i in list) {
      result.add({
        "patient_id": userId,
        "title": i.title,
        "file_name": i.file_name,
        "date":
            "${i.date_time.year}-${i.date_time.month.toString().padLeft(2, '0')}-${i.date_time.day.toString().padLeft(2, '0')}",
      });
    }
    return result;
  }
}

UserMood userMoodFromJson(String str) {
  final jsonData = json.decode(str);
  return UserMood.fromJson(jsonData);
}

String userMoodToJson(UserMood data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}

class UserMoodTotal {
  String file_name;
  String title;
  int count;

  UserMoodTotal({this.file_name, this.title, this.count});

  factory UserMoodTotal.fromJson(Map<String, dynamic> json) =>
      new UserMoodTotal(
          title: json["title"],
          file_name: json["file_name"],
          count: json["count"]);
}
