import 'dart:convert';
import 'dart:io';

import 'package:hiv/data/configs.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io' as Io;

import 'db_provider.dart';
import 'model/user.dart';

class UserImageFile {
  int id;
  int sent;
  int user_id;
  int type;
  String path;
  String file_name;
  DateTime date_time;


  UserImageFile({this.id, this.user_id, this.path, this.file_name, this.type, this.date_time, this.sent});

  factory UserImageFile.fromJson(Map<String, dynamic> json) => new UserImageFile(
      id: json["id"],
      user_id: json["user_id"],
      path: json["path"],
      type: json["type"],
      file_name: json["file_name"],
      date_time: DateTime.parse(json["date_time"]),
      sent: json["sent"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": user_id,
    "path": path,
    "type": type,
    "file_name": file_name,
    "date_time": date_time.toString(),
    "sent": sent
  };

  Map<String, dynamic> toJsonForServer(int id) => {
    "patient_id": id,
    "type": convertTypeToString(type),
    "img_base_64": imageToBase64(path),
    "date": date_time,
  };

  static imageToBase64(String filePath){
    final bytes = Io.File(filePath).readAsBytesSync();
    String base64Encode(List<int> bytes) => base64.encode(bytes);
    return base64Encode(bytes);
  }

  Future<bool> send() async {
    final url =
        Configs.ip+'api/patientresultimages';
    DbUser userDb = await DBProvider.db.getUser();
    try {
      Map<String, String> headers = {"Content-type": "application/json"};
      final response = await http.post(
        url,
        headers:headers,
        body: json.encode(
            {
              "patient_id": userDb.id,
              "type": convertTypeToString(type),
              "img_base_64": file_name,
              "date": date_time,
            }),
      );
      var rr = json.decode(response.body);
      return true;
    }
    catch (error) {
      throw error;
    }
  }

  static Future<bool> sendList(List<UserImageFile> list, int user_id) async {
    final url =
        Configs.ip+'api/patientresultimages';
    try {
      Map<String, String> headers = {"Content-type": "application/json"};
      final response = await http.post(
        url,
        headers:headers,
        body: json.encode(
            {
              "data": userImageFileList(list, user_id)
            }),
      );
      var rr = json.decode(response.body);
      return true;
    }
    catch (error) {
      throw error;
    }
  }

  static Future<bool>  getList() async {
    await DBProvider.db.getUser().then((value) async {
      final url =
          Configs.ip+'api/patientresultimages/'+value.id.toString();
      try {
        Map<String, String> headers = {"Content-type": "application/json","token": value.token};
        final response = await http.get(
          url,
          headers:headers,
        );
        saveListToDatabase(json.decode(response.body));
        return true;
      }
      catch (error) {
        throw error;
      }
    });
  }

  static Future<List<UserImageFile>> saveListToDatabase(var responseBody ) async{
    List<UserImageFile> list = new List<UserImageFile>();
    for(var i in responseBody['data']){
      var url = Configs.file_ip + i['image']; // <-- 1
      var response = await get(url); // <--2
      var documentDirectory = await getApplicationDocumentsDirectory();
      var firstPath = documentDirectory.path + "/images";
      var nowString = DateTime.now().millisecondsSinceEpoch.toString()+'.png';
      var filePathAndName = documentDirectory.path + '/images/'+nowString;
      await Directory(firstPath).create(recursive: true); // <-- 1
      File file2 = new File(filePathAndName);             // <-- 2
      file2.writeAsBytesSync(response.bodyBytes);
      UserImageFile model = new UserImageFile();

      model.user_id = responseBody['id'];
      model.path = file2.path;
      model.file_name = nowString;
      model.date_time = DateTime.parse(i['datetime']);
      model.sent = 1;
      model.type = convertStringToType(i['type']);

      DBProvider.db.newUserImage1(model);
      list.add(model);
    }
    return list;
  }

  static List<Map<String, dynamic>> userImageFileList(List<UserImageFile> list, int user_id) {
    List<Map<String, dynamic>> result = new List<Map<String, dynamic>>();
    for(var i in list){
      result.add({
        "patient_id": user_id,
        "type": convertTypeToString(i.type),
        "img_base_64": imageToBase64(i.path),
        "datetime": "${i.date_time.year}-${i.date_time.month.toString().padLeft(2, '0')}-${i.date_time.day.toString().padLeft(2, '0')}",
      });
    }
    return result;
  }

  static String convertTypeToString(int type){
    if(type ==1)
      return "doctors_appointment";
    else
      return "test_result";
  }
  static int convertStringToType(String type){
    if(type == "doctors_appointment")
      return 1;
    else
      return 2;
  }
}
UserImageFile userImageFileFromJson(String str) {
  final jsonData = json.decode(str);
  return UserImageFile.fromJson(jsonData);
}

String userImageFileToJson(UserImageFile data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}