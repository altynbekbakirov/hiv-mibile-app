import 'dart:convert';
import 'package:hiv/data/configs.dart';
import 'package:hiv/data/pref_manager.dart';
import 'package:hiv/db/db_provider.dart';
import 'package:hiv/db/image_files.dart';
import 'package:hiv/db/model/user.dart';
import 'package:hiv/db/notification.dart';
import 'package:hiv/db/user_mood.dart';
import 'package:hiv/db/user_symptom.dart';
import 'package:hiv/model/rating_model.dart';
import 'package:hiv/pages/add/notification_form.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'http_exceptions.dart';

class User extends ChangeNotifier {
  int user_id;
  String username;
  String password;
  int first_question;
  String first_question_answer;
  int second_question;
  String second_question_answer;
  int gender;
  bool intersex;
  int sex;
  int birth_year;
  String pin_code;
  String token;

  Future<void> create() async {
    final url = Configs.ip + 'api/users';
    try {
      Map<String, String> headers = {"Content-type": "application/json"};
      final response = await http.post(
        url,
        headers: headers,
        body: json.encode(userRequestBodyToJson(this)),
      );
      final responseData = json.decode(response.body);
      if (responseData['status'] == 999) {
        throw HttpException(responseData['status'].toString());
      } else if (responseData['status'] == 888) {
        throw HttpException(responseData['status'].toString());
      } else if (responseData['token'] != null) {
        Prefs.setString('username', username);
        Prefs.setString('password', password);
        Prefs.setString(Prefs.USERNAME, username);
        Prefs.setString(Prefs.PASSWORD, password);
        Prefs.setString(Prefs.TOKEN, responseData["token"]);
        Prefs.setInt(Prefs.USER_ID, responseData["id"]);
        this.token = responseData['token'];
        this.token = responseData['token'];
        this.user_id = responseData['id'];

        await DBProvider.db.deleteAllUsers();
        DbUser dbUser = new DbUser();
        dbUser.username = username;
        dbUser.password = password;
        dbUser.pin_code = pin_code;
        dbUser.token = responseData['token'];
        dbUser.id = responseData['id'];
        await DBProvider.db.newUser(dbUser);
        notifyListeners();
      }
    } catch (error) {
      throw error;
    }
  }

  Map<String, dynamic> userRequestBodyToJson(User user) => {
        'username': user.username,
        'password': user.password,
        'question_id1': user.first_question,
        'answer1': user.first_question_answer,
        'question_id2': user.second_question,
        'answer2': user.second_question_answer,
        'gender_id': user.gender,
        'sex_id': user.sex,
        'intersex': user.intersex,
        'year_of_birth': user.birth_year,
        'pin_kod': user.pin_code,
      };

  bool get isAuth {
    return token != null;
  }

  Future<void> _authenticate(String username, String password) async {
    final url = Configs.ip + 'api/login';
    try {
      Map<String, String> headers = {"Content-type": "application/json"};
      final response = await http.post(
        url,
        headers: headers,
        body: json.encode(loginRequestBodyToJson(username.trim(), password.trim())),
      );
      final responseData = json.decode(response.body);
      if (responseData['status'] == 999) {
        throw HttpException(responseData['status'].toString());
      } else if (responseData['status'] == 888) {
        throw HttpException(responseData['status'].toString());
      } else if (responseData['token'] != null) {
        this.username = username;
        this.password = password;
        Prefs.setString('username', username);
        Prefs.setString('password', password);
        Prefs.setString(Prefs.USERNAME, username);
        Prefs.setString(Prefs.PASSWORD, password);
        Prefs.setString(Prefs.TOKEN, responseData["token"]);
        Prefs.setInt(Prefs.USER_ID, responseData["id"]);

        DbUser dbUser = new DbUser();
        dbUser.username = username;
        dbUser.password = password;
        dbUser.token = responseData['token'];
        dbUser.pin_code = responseData['pin_kod'];
        dbUser.id = responseData['id'];
        await DBProvider.db.newUser(dbUser);
        UserMood.getList();
        UserSymptom.getList();
        UserImageFile.getList();
        NotificationDb.getList();
        RatingModel.getList();

        this.user_id = responseData["id"];
        this.token = responseData["token"];
        notifyListeners();
      }
    } catch (error) {
      throw error;
    }
  }

  Future<bool> checkUsername(String username) async {
    final url = Configs.ip + 'api/userexist';
    try {
      Map<String, String> headers = {"Content-type": "application/json"};
      final response = await http.post(
        url,
        headers: headers,
        body: json.encode({
          'username': username,
        }),
      );
      return json.decode(response.body);
    } catch (error) {
      throw error;
    }
  }

  Future<void> login(String email, String password) async {
    return _authenticate(email, password);
  }

  Future setPinCode(String pinCode) async {
    DbUser user = await DBProvider.db.getUser();
    final url = Configs.ip + 'api/set_pin_kod/' + user.id.toString();
    try {
      Map<String, String> headers = {
        "Content-type": "application/json",
        "token": user.token
      };
      final response = await http.post(
        url,
        headers: headers,
        body: json.encode({"pin_kod": pinCode}),
      );
      final responseData = json.decode(response.body);
      if (responseData['status'] == 999) {
        throw HttpException(responseData['status'].toString());
      } else if (responseData['status'] == 888) {
        throw HttpException(responseData['status'].toString());
      } else if (responseData['token'] != null) {
        Prefs.setString('pin_code', pinCode);
        this.pin_code = pinCode;
        DbUser dbUser = await DBProvider.db.getUser();
        dbUser.pin_code = pinCode;
        await DBProvider.db.updateUser(dbUser);
        notifyListeners();
      }
    } catch (error) {
      throw error;
    }
  }

  Future setLevelApi(String level) async {
    DbUser user = await DBProvider.db.getUser();
    final url = Configs.ip + 'api/set_level';
    try {
      Map<String, String> headers = {
        "Content-type": "application/json",
        "token": user.token
      };
      final response = await http.post(
        url,
        headers: headers,
        body: json.encode({"id": user.id, "level": level}),
      );
      final responseData = json.decode(response.body);
      if (responseData['status'] == 999) {
        throw HttpException(responseData['status'].toString());
      } else if (responseData['status'] == 888) {
        throw HttpException(responseData['status'].toString());
      }
    } catch (error) {
      throw error;
    }
  }

  Future setFinishApi(String finish) async {
    DbUser user = await DBProvider.db.getUser();
    final url = Configs.ip + 'api/set_finish';
    try {
      Map<String, String> headers = {
        "Content-type": "application/json",
        "token": user.token
      };
      final response = await http.post(
        url,
        headers: headers,
        body: json.encode({"id": user.id, "finish": finish}),
      );
      final responseData = json.decode(response.body);
      if (responseData['status'] == 999) {
        throw HttpException(responseData['status'].toString());
      } else if (responseData['status'] == 888) {
        throw HttpException(responseData['status'].toString());
      }
    } catch (error) {
      throw error;
    }
  }

  Future<User> getIdByUserName(String username) async {
    final url = Configs.ip + 'api/get_id_by_username/' + username;

    User user = User();

    try {
      Map<String, String> headers = {"Content-type": "application/json"};
      final response = await http.get(
        url,
        headers: headers,
      );
      final responseData = json.decode(response.body);
      if (responseData['success'] == false) {
        throw HttpException("User is not found");
      } else if (responseData['success'] == true) {
        this.user_id = responseData['id'];
        this.pin_code = responseData['pin'];
        user.user_id = responseData['id'];
        user.pin_code = responseData['pin'];
      }
    } catch (error) {
      throw error;
    }
    return user;
  }

  Future<void> setPassword(
      String password, bool fromChangePassword, int userId) async {
    final url = Configs.ip + 'api/change-password/' + userId.toString();
    try {
      Map<String, String> headers = {
        "Content-type": "application/json",
        "token": Prefs.getString(Prefs.TOKEN)
      };
      final response = await http.put(
        url,
        headers: headers,
        body: json.encode({"new_password": password}),
      );
      final responseData = json.decode(response.body);
      if (responseData['status'] == 999) {
        throw HttpException(responseData['status'].toString());
      } else if (responseData['status'] == 888) {
        throw HttpException(responseData['status'].toString());
      } else if (responseData['token'] != null) {
        Prefs.setString(Prefs.PASSWORD, password);
        Prefs.setInt(Prefs.USER_ID, responseData['id']);
        Prefs.setString(Prefs.TOKEN, responseData['token']);
        this.password = password;
        if (fromChangePassword) {
          DbUser dbUser = await DBProvider.db.getUser();
          dbUser.username = username;
          dbUser.token = responseData['token'];
          dbUser.password = password;
          await DBProvider.db.updateUser(dbUser);
        }

        notifyListeners();
      }
    } catch (error) {
      throw error;
    }
  }

  Future<void> resetPassword(User user) async {
    final url = Configs.ip + 'api/resetpassword/';
    try {
      Map<String, String> headers = {
        "Content-type": "application/json",
        "token": Prefs.getString(Prefs.TOKEN)
      };
      final response = await http.post(
        url,
        headers: headers,
        body: json.encode({
          "username": user.username,
          "question1_id": user.first_question,
          "answer1": user.first_question_answer,
          "question2_id": user.second_question,
          "answer2": user.second_question_answer,
        }),
      );
      final responseData = json.decode(response.body);
      if (responseData == false) {
        throw HttpException("Не совпадают ответы на вопросы");
      }
      if (responseData['status'] == 999) {
        throw HttpException(responseData['status'].toString());
      } else if (responseData['status'] == 888) {
        throw HttpException(responseData['status'].toString());
      } else if (responseData == "false") {
        throw HttpException("Не совпадают ответы на вопросы");
      } else if (responseData['token'] != null) {
        Prefs.setString(Prefs.TOKEN, responseData['token']);
        Prefs.setInt(Prefs.USER_ID, responseData['id']);
//        DbUser dbUser = await DBProvider.db.getUser();
//        dbUser.token = responseData['token'];
//        dbUser.id = responseData['id'];
//        DBProvider.db.updateUser(dbUser);
        notifyListeners();
      }
    } catch (error) {
      throw error;
    }
  }

  void logout() async {
    var userId = 0;
    await DBProvider.db.getUser().then((value) async {
      if (value != null) {
        userId = value.id;
        final url = Configs.ip + 'api/logged';
        try {
          Map<String, String> headers = {"Content-type": "application/json"};
          final response = await http.post(
            url,
            headers: headers,
            body: json.encode({"id": value.id}),
          );
          final responseData = json.decode(response.body);
          if (responseData == "successfully") {
            await DBProvider.db.sendNotSentUserSymptoms(userId, true);
            await DBProvider.db.sendNotSentNotifications();
            await DBProvider.db.sendNotSentUserMoods(userId, true);
            await DBProvider.db.sendNotSentUserImages(user_id, true);
            await DBProvider.db.deleteAllRatings();
            await DBProvider.db.deleteAllUsers();
            NotificationFormState.cancelAllNotifications();
            Prefs.clear();

            notifyListeners();
          }
        } catch (error) {
          throw error;
        }
      }
    });
  }

  static void sendMapTestView(int userId) async {
    final url = Configs.ip + 'api/statistics';
    try {
      Map<String, String> headers = {"Content-type": "application/json"};
      final response = await http.post(
        url,
        headers: headers,
        body: json.encode({"user_id": userId, }),
      );
      final responseData = json.decode(response.body);
      print(responseData);
    } catch (error) {
      throw error;
    }
  }

  int getUserId() {
    return user_id;
  }

  String getName() {
    return username;
  }

  static Map<String, dynamic> loginRequestBodyToJson(
          String username, String password) =>
      {
        'username': username,
        'password': password,
      };
}
