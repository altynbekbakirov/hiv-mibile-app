import 'dart:convert';

import 'package:hiv/data/configs.dart';
import 'package:http/http.dart' as http;

import 'db_provider.dart';
import 'model/user.dart';

class UserSymptom {
  int id;
  int sent;
  int user_id;
  String title;
  String file_name;
  DateTime date_time;
  double rating;

  UserSymptom(
      {this.id,
      this.user_id,
      this.title,
      this.file_name,
      this.date_time,
      this.rating,
      this.sent});

  factory UserSymptom.fromJson(Map<String, dynamic> json) => new UserSymptom(
      id: json["id"],
      user_id: json["user_id"],
      title: json["title"],
      file_name: json["file_name"],
      date_time: DateTime.parse(json["date_time"]),
      rating: json['rating'],
      sent: json['sent']);

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": user_id,
        "title": title,
        "file_name": file_name,
        "date_time": date_time.toString(),
        "rating": rating,
        "sent": sent,
      };

  Future<bool> send() async {
    final url = Configs.ip + 'api/patientsymptoms';
    DbUser userDb = await DBProvider.db.getUser();
    try {
      Map<String, String> headers = {"Content-type": "application/json"};
      final response = await http.post(
        url,
        headers: headers,
        body: {
          "data": [
            json.encode({
              "patient_id": userDb.id,
              "title": title,
              "file_name": file_name,
              "level": rating.round(),
              "date": "${date_time.year}-${date_time.month}-${date_time.day}",
            })
          ]
        },
      );
      var rr = json.decode(response.body);
      return true;
    } catch (error) {
      throw error;
    }
  }

  static Future<bool> sendList(List<UserSymptom> list, int user_id) async {
    final url = Configs.ip + 'api/patientsymptoms';
    try {
      Map<String, String> headers = {"Content-type": "application/json"};
      await http.post(
        url,
        headers: headers,
        body: json.encode({"data": userSymptomList(list, user_id)}),
      );
      return true;
    } catch (error) {
      throw error;
    }
  }

  static Future<bool> getList() async {
    await DBProvider.db.getUser().then((value) async {
      final url = Configs.ip + 'api/patientsymptoms/' + value.id.toString();
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

  static Future<List<UserSymptom>> saveListToDatabase(var responseBody) async {
    List<UserSymptom> list = new List<UserSymptom>();
    for (var i in responseBody) {
      UserSymptom model = new UserSymptom();

      model.user_id = i['patient_id'];
      model.title = i['title'];
      model.file_name = i['file_name'];
      model.date_time = DateTime.parse(i['date']);
      model.rating = double.parse(i['level']);
      model.sent = 1;

      await DBProvider.db.newUserSymptom1(model);
      list.add(model);
    }
    return list;
  }

  static List<Map<String, dynamic>> userSymptomList(
      List<UserSymptom> list, int userId) {
    List<Map<String, dynamic>> result = new List<Map<String, dynamic>>();
    if (list != null) {
      for (var i in list) {
        result.add({
          "patient_id": userId,
          "title": i.title,
          "date": i.date_time.toString(),
          "file_name": i.file_name,
          "level": i.rating.round(),
        });
      }
    }
    return result;
  }

  @override
  String toString() {
    return 'UserSymptom{id: $id, sent: $sent, user_id: $user_id, title: $title, file_name: $file_name, date_time: $date_time, rating: $rating}';
  }
}

UserSymptom userSymptomFromJson(String str) {
  final jsonData = json.decode(str);
  return UserSymptom.fromJson(jsonData);
}

String userSymptomToJson(UserSymptom data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}

class UserSymptomTotal {
  String file_name;
  String title;
  int count;

  UserSymptomTotal({this.file_name, this.title, this.count});

  factory UserSymptomTotal.fromJson(Map<String, dynamic> json) =>
      new UserSymptomTotal(
          title: json["title"],
          file_name: json["file_name"],
          count: json["count"]);
}
