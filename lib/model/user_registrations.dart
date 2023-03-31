import 'dart:convert';

import 'package:hiv/data/configs.dart';
import 'package:hiv/data/pref_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import 'http_exceptions.dart';

class GeneralModel {
  int id;
  String ru;
  String ky;

  GeneralModel({this.id, this.ru, this.ky});


}
class Sex extends GeneralModel{
  Sex() : super();
}
class UserQuestion extends GeneralModel{

  UserQuestion() : super();
}
class Gender extends GeneralModel{
  Gender() : super();
}

class UserRegistration extends ChangeNotifier{
  List<Sex> _sexes;
  List<UserQuestion> _userQuestions;
  List<Gender> _genders;


  List<Sex> get sexes => _sexes;
  List<UserQuestion> get userQuestions => _userQuestions;
  List<Gender> get genders => _genders;

  Future<void> getList() async {
    final url =
        Configs.ip+'api/resourcesforuserregistration';
    try {
      Map<String, String> headers = {"Content-type": "application/json"};
      final response = await http.get(
        url,
        headers:headers,
      );
      final responseData = json.decode(response.body);
      responseToObjects(responseData);
      if (responseData['status'] == 999) {
        throw HttpException(responseData['status'].toString());
      }
      else if (responseData['status'] == 888) {
        throw HttpException(responseData['status'].toString());
      }
      notifyListeners();
    }
    catch (error) {
      throw error;
    }
  }

  void responseToObjects(var responseBody){
    _userQuestions = JsonToUserQuestionList(responseBody['userquestion']);
    _sexes = JsonToSexList(responseBody['sex']);
    _genders = JsonToGenderList(responseBody['gender']);

    notifyListeners();
  }
  List<UserQuestion> JsonToUserQuestionList(var responseData){
    List<UserQuestion> list = new List<UserQuestion>();
    for(var i in responseData){
      UserQuestion userQuestion = new UserQuestion();
      userQuestion.id = i['userquestion']['id'];
      userQuestion.ru = i['userquestion']['ru'];
      userQuestion.ky = i['userquestion']['ky'];
      list.add(userQuestion);
    }
    return list;
  }
  List<Sex> JsonToSexList(var responseData){
    List<Sex> list = new List<Sex>();
    for(var i in responseData){
      Sex sex = new Sex();
      sex.id = i['sex']['id'];
      sex.ru = i['sex']['ru'];
      sex.ky = i['sex']['ky'];
      list.add(sex);
    }
    return list;
  }
  List<Gender> JsonToGenderList(var responseData){
    List<Gender> list = new List<Gender>();
    for(var i in responseData){
      Gender gender = new Gender();
      gender.id = i['gender']['id'];
      gender.ru = i['gender']['ru'];
      gender.ky = i['gender']['ky'];
      list.add(gender);
    }
    return list;
  }
}
