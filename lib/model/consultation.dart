import 'dart:convert';
import 'package:hiv/data/configs.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class ConsultationTheme {
  String ky;
  String ru;
}

class Location {
  double longitude;
  double latitude;
}


class ConsultantModel {
  int theme_id;
  int consultant_id;
  ConsultationTheme theme;
  String whatsapp;
  String facebook;
  String telegram;
  String messenger;
  String phone_number;
  Location location;
}

class Consultation extends ChangeNotifier {
  List<ConsultantModel> _list = new List<ConsultantModel>();
  List<ConsultantModel> get list => _list;

  Future<void> getConsultants() async {
    final url =
        Configs.ip+'api/consultants';
    try {
      Map<String, String> headers = {"Content-type": "application/json"};
      final response = await http.get(
        url,
        headers:headers,
      );
      final responseData = json.decode(response.body);
      responseToObjects(responseData);
    }
    catch (error) {
      throw error;
    }
  }

  List<ConsultantModel> responseToObjects(var responseBody){
    _list.clear();
    for(var j in responseBody){
      var i = j[0];
      ConsultantModel model = new ConsultantModel();

      model.theme_id = i['theme_id'];
      model.consultant_id = i['consultant_id'];
      model.phone_number = i['phone_number'];
      model.whatsapp = i['whatsapp'];
      model.telegram = i['telegram'];
      model.messenger = i['messenger'];
      model.facebook = i['facebook'];
      model.theme = jsonToTheme(i['theme']);
      model.location = jsonToLocation(i['location']);

      _list.add(model);
    }
    notifyListeners();
    return _list;
  }

  ConsultationTheme jsonToTheme(var responseData){
    ConsultationTheme consultationTheme = new ConsultationTheme();
    consultationTheme.ky = responseData['ky'];
    consultationTheme.ru = responseData['ru'];

    return consultationTheme;
  }

  Location jsonToLocation(var responseData){
    Location location = new Location();
    location.longitude = responseData['longitude'];
    location.latitude = responseData['latitude'];

    return location;
  }
}