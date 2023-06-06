import 'dart:io';
import 'package:hiv/db/image_files.dart';
import 'package:hiv/db/map_point.dart';
import 'package:hiv/db/model/answer.dart';
import 'package:hiv/db/notification.dart';
import 'package:hiv/db/user_mood.dart';
import 'package:hiv/db/user_symptom.dart';
import 'package:hiv/db/audio_db.dart';
import 'package:hiv/model/rating_model.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:connectivity/connectivity.dart';
import 'model/category.dart';
import 'model/consultation.dart';
import 'model/question.dart';
import 'model/user.dart';

class DBProvider {
  DBProvider._();

  static final DBProvider db = DBProvider._();

  static Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await initDB();
    return _database;
  }

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "hiv.db");
    return await openDatabase(path, version: 2, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute("CREATE TABLE users ("
          "id INTEGER PRIMARY KEY AUTOINCREMENT,"
          "username TEXT,"
          "password TEXT,"
          "token TEXT,"
          "pin_code TEXT"
          ")");

      await db.execute("CREATE TABLE test_categories ("
          "id INTEGER PRIMARY KEY AUTOINCREMENT,"
          "name_ky TEXT,"
          "name_ru TEXT"
          ")");

      await db.execute("CREATE TABLE test_questions ("
          "id INTEGER PRIMARY KEY AUTOINCREMENT,"
          "name_ky TEXT,"
          "name_ru TEXT,"
          "category_id INTEGER,"
          "CONSTRAINT fk_category\n"
          "FOREIGN KEY(category_id)\n "
          "REFERENCES test_categories(id)"
          ")");

      await db.execute("CREATE TABLE test_answers ("
          "id INTEGER PRIMARY KEY AUTOINCREMENT,"
          "name_ky TEXT,"
          "name_ru TEXT,"
          "question_id INTEGER,"
          "CONSTRAINT fk_question\n"
          "FOREIGN KEY (question_id)\n"
          "REFERENCES test_questions(id)"
          ")");

      await db.execute("CREATE TABLE consultation ("
          "id INTEGER PRIMARY KEY AUTOINCREMENT,"
          "consultant_id INTEGER,"
          "name_ky TEXT,"
          "name_ru TEXT,"
          "whatsapp TEXT,"
          "telegram TEXT,"
          "facebook TEXT,"
          "messenger TEXT,"
          "phone_number TEXT,"
          "latitude REAL,"
          "longitude REAL"
          ")");

      await db.execute("CREATE TABLE notifications ("
          "id INTEGER PRIMARY KEY AUTOINCREMENT,"
          "description TEXT,"
          "datetime DATETIME,"
          "time_type TEXT CHECK( time_type IN ('NotificationDbTimeType.Hour','NotificationDbTimeType.Day','NotificationDbTimeType.Month') )   NOT NULL,"
          "type TEXT CHECK( type IN ('NotificationDbType.Drug','NotificationDbType.Visit','NotificationDbType.Analysis') )   NOT NULL,"
          "sent INTEGER NOT NULL DEFAULT 1"
          ")");

      await db.execute("CREATE TABLE map_points ("
          "id INTEGER PRIMARY KEY AUTOINCREMENT,"
          "name_ky TEXT,"
          "name_ru TEXT,"
          "description TEXT,"
          "latitude REAL,"
          "longitude REAL,"
          "type INTEGER"
          ")");

      await db.execute("CREATE TABLE user_symptoms ("
          "id INTEGER PRIMARY KEY AUTOINCREMENT,"
          "user_id INTEGER,"
          "title TEXT,"
          "file_name TEXT,"
          "date_time DATETIME,"
          "sent INTEGER NOT NULL DEFAULT 0,"
          "rating REAL,"
          "CONSTRAINT fk_user\n"
          "FOREIGN KEY (user_id)\n"
          "REFERENCES users(id)\n"
          ")");

      await db.execute("CREATE TABLE user_moods ("
          "id INTEGER PRIMARY KEY AUTOINCREMENT,"
          "user_id INTEGER,"
          "title TEXT,"
          "file_name TEXT,"
          "sent INTEGER NOT NULL DEFAULT 0,"
          "date_time DATETIME,"
          "CONSTRAINT fk_user\n"
          "FOREIGN KEY (user_id)\n"
          "REFERENCES users(id)\n"
          ")");

      await db.execute("CREATE TABLE user_images ("
          "id INTEGER PRIMARY KEY AUTOINCREMENT,"
          "user_id INTEGER,"
          "path TEXT,"
          "type INTEGER,"
          "file_name TEXT,"
          "sent INTEGER NOT NULL DEFAULT 1,"
          "date_time DATETIME,"
          "CONSTRAINT fk_user\n"
          "FOREIGN KEY (user_id)\n"
          "REFERENCES users(id)\n"
          ")");

      await db.execute("CREATE TABLE audio_files ("
          "id INTEGER PRIMARY KEY AUTOINCREMENT,"
          "local_path TEXT,"
          "title TEXT,"
          "category_name TEXT,"
          "remote_path TEXT"
          ")");

      await db.execute(
        "CREATE TABLE hiv(id INTEGER PRIMARY KEY, name TEXT, age INTEGER)",
      );

      await db.execute("CREATE TABLE ratings ("
          "id INTEGER,"
          "consultant_id INTEGER,"
          "consultant_name TEXT,"
          "user_id INTEGER,"
          "user_name TEXT,"
          "rating REAL)");
    }, onUpgrade: (Database db, int version, int lastVersion) async {
      if (lastVersion > version) {
        await db.execute("CREATE TABLE ratings ("
            "id INTEGER,"
            "consultant_id INTEGER,"
            "consultant_name TEXT,"
            "user_id INTEGER,"
            "user_name TEXT,"
            "rating REAL)");
      }
    });
  }

  Future<bool> _checkInternetConnection() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      return true;
    } else {
      return false;
    }
  }

  //region Database models' functions:
  //region User
  newUser(DbUser newUser) async {
    deleteAllUsers();
    final db = await database;
    //get the biggest id in the table
    //insert to the table using the new id
    var raw = await db.rawInsert(
        "INSERT Into users(id,username,password, token, pin_code)"
        " VALUES (?,?,?,?,?)",
        [
          newUser.id,
          newUser.username,
          newUser.password,
          newUser.token,
          newUser.pin_code
        ]);
    return raw;
  }

  Future<DbUser> getUser() async {
    final db = await database;
    var res;
    await db.query("users", limit: 1).then((value) {
      if (value.length > 0) {
        res = DbUser.fromJson(value.first);
      }
      // res = value.firstWhere((a) => a != null, orElse: () => null);
    });
    return res;
  }

  Future<int> getUserId() async {
    final db = await database;
    var res = await db.query("users", limit: 1);
    return res.isNotEmpty ? res.first['id'] : null;
  }

  updateUser(DbUser newUser) async {
    final db = await database;
    var res = await db.update("users", newUser.toJson(),
        where: "id = ?", whereArgs: [newUser.id]);
    return res;
  }

  deleteUser(int id) async {
    final db = await database;
    db.delete("users", where: "id = ?", whereArgs: [id]);
  }

  deleteAllUsers() async {
    final db = await database;
    db.rawDelete("Delete from users");
  }

  //endregion
  //region Categories
  newCategory(Category model) async {
    final db = await database;
    //get the biggest id in the table
    //insert to the table using the new id
    var raw = await db.rawInsert(
        "INSERT Into test_categories(id,name_ky, name_ru)"
        " VALUES (?,?,?)",
        [model.id, model.name_ky, model.name_ru]);
    return raw;
  }

  getCategory(int id) async {
    final db = await database;
    var res =
        await db.query("test_categories", where: "id = ?", whereArgs: [id]);
    return res.isNotEmpty ? Category.fromJson(res.first) : Null;
  }

  updateCategory(Category newModel) async {
    final db = await database;
    var res = await db.update("test_categories", newModel.toJson(),
        where: "id = ?", whereArgs: [newModel.id]);
    return res;
  }

  deleteCategory(int id) async {
    final db = await database;
    db.delete("test_categories", where: "id = ?", whereArgs: [id]);
  }

  deleteAllCategories() async {
    final db = await database;
    db.rawDelete("Delete * from test_categories");
  }

  //endregion
  //region Questions
  newQuestion(Question model) async {
    final db = await database;
    //get the biggest id in the table
    //insert to the table using the new id
    var raw = await db.rawInsert(
        "INSERT Into test_questions(id, name_ky, name_ru, category_id)"
        " VALUES (?,?,?,?)",
        [model.id, model.name_ky, model.name_ru, model.category_id]);
    return raw;
  }

  getQuestion(int id) async {
    final db = await database;
    var res =
        await db.query("test_questions", where: "id = ?", whereArgs: [id]);
    return res.isNotEmpty ? Question.fromJson(res.first) : Null;
  }

  updateQuestion(Question newModel) async {
    final db = await database;
    var res = await db.update("test_questions", newModel.toJson(),
        where: "id = ?", whereArgs: [newModel.id]);
    return res;
  }

  deleteQuestion(int id) async {
    final db = await database;
    db.delete("test_questions", where: "id = ?", whereArgs: [id]);
  }

  deleteAllQuestions() async {
    final db = await database;
    db.rawDelete("Delete * from test_questions");
  }

  //endregion
  //region Answers
  newAnswer(Answer model) async {
    final db = await database;
    //get the biggest id in the table
    //insert to the table using the new id
    var raw = await db.rawInsert(
        "INSERT Into test_answers(id, name_ky, name_ru, question_id)"
        " VALUES (?,?,?,?)",
        [model.id, model.name_ky, model.name_ru, model.question_id]);
    return raw;
  }

  getAnswer(int id) async {
    final db = await database;
    var res = await db.query("test_answers", where: "id = ?", whereArgs: [id]);
    return res.isNotEmpty ? Answer.fromJson(res.first) : Null;
  }

  updateAnswer(Answer newModel) async {
    final db = await database;
    var res = await db.update("test_answers", newModel.toJson(),
        where: "id = ?", whereArgs: [newModel.id]);
    return res;
  }

  deleteAnswer(int id) async {
    final db = await database;
    db.delete("test_answers", where: "id = ?", whereArgs: [id]);
  }

  deleteAllAnswers() async {
    final db = await database;
    db.rawDelete("Delete * from test_answers");
  }

  //endregion
  //region Consultations
  newConsultation(Consultation model) async {
    final db = await database;
    //get the biggest id in the table
    //insert to the table using the new id
    var raw = await db.rawInsert(
        "INSERT Into consultation(id, consultant_id, name_ky, name_ru, whatsapp, telegram, facebook, messenger, phone_number, latitude, longitude)"
        " VALUES (?,?,?,?,?,?,?,?,?,?,?)",
        [
          model.id,
          model.consultant_id,
          model.name_ky,
          model.name_ru,
          model.whatsapp,
          model.telegram,
          model.facebook,
          model.messenger,
          model.phone_number,
          model.latitude,
          model.longitude
        ]);
    return raw;
  }

  getConsultation(int id) async {
    final db = await database;
    var res = await db.query("consultation", where: "id = ?", whereArgs: [id]);
    return res.isNotEmpty ? Consultation.fromJson(res.first) : Null;
  }

  updateConsultation(Answer newModel) async {
    final db = await database;
    var res = await db.update("consultation", newModel.toJson(),
        where: "id = ?", whereArgs: [newModel.id]);
    return res;
  }

  deleteConsultation(int id) async {
    final db = await database;
    db.delete("consultation", where: "id = ?", whereArgs: [id]);
  }

  deleteAllConsultations() async {
    final db = await database;
    db.rawDelete("Delete * from consultation");
  }

  insertRating(RatingModel model) async {
    final db = await database;
    await db.insert(ratingTable, model.toJson());
  }

  updateRating(RatingModel model) async {
    final db = await database;
    await db.update(ratingTable, model.toJson(),
        where: 'id = ?', whereArgs: [model.id]);
  }

  Future<List<RatingModel>> getRatingsByUser(int userID) async {
    final db = await database;
    final result =
        await db.query(ratingTable, where: 'user_id = ?', whereArgs: [userID]);
    return result.map((e) => RatingModel.fromJson(e)).toList();
  }

  deleteAllRatings() async {
    final db = await database;
    db.rawDelete("Delete from ratings");
  }

  //endregion
  //region Notifications
  Future<int> newNotification(NotificationDb model) async {
    final db = await database;
    //get the biggest id in the table
    //insert to the table using the new id
    var raw = await db.insert("notifications", model.toJson());
    await sendNotSentNotifications();
    return raw;
  }

  Future<void> sendNotSentNotifications({int user_id}) async {
    _checkInternetConnection().then((value) async {
      if (value) {
        getNotificationsBySent().then((list) {
          NotificationDb.sendList(list, user_id: user_id).then((value) {
            for (var i in list) {
              i.sent = 1;
              updateNotification(i);
            }
          });
        });
        await deleteAllNotifications();
      }
    });
  }

  Future<int> newNotification1(NotificationDb model) async {
    final db = await database;
    model.sent = 1;
    //get the biggest id in the table
    //insert to the table using the new id
    var raw = await db.insert("notifications", model.toJson());
    return raw;
  }

  getNotification(int id) async {
    final db = await database;
    var res = await db.query("notifications", where: "id = ?", whereArgs: [id]);
    return res.isNotEmpty ? NotificationDb.fromJson(res.first) : Null;
  }

  Future<List<NotificationDb>> getAllNotifications() async {
    final db = await database;
    var res = await db.query("notifications", orderBy: "datetime DESC");
    List<NotificationDb> list = new List<NotificationDb>();
    for (var r in res) {
      list.add(NotificationDb.fromJson(r));
    }
    return list;
  }

  Future<List<NotificationDb>> getNotificationsByType(
      NotificationDbType type) async {
    final db = await database;
    List<NotificationDb> list = new List<NotificationDb>();
    await db.query("notifications",
        where: "type = ?", whereArgs: [type.toString()]).then((value) {
      for (var r in value) {
        list.add(NotificationDb.fromJson(r));
      }
    });
    return list;
  }

  Future<List<NotificationDb>> getNotificationsBySent() async {
    List<NotificationDb> list = new List<NotificationDb>();
    final db = await database;
    await db.query("notifications", where: "sent = ?", whereArgs: [0]).then(
        (value) {
      for (var r in value) {
        list.add(NotificationDb.fromJson(r));
      }
    });
    return list;
  }

  updateNotification(NotificationDb newModel) async {
    final db = await database;
    var res = await db.update("notifications", newModel.toJson(),
        where: "id = ?", whereArgs: [newModel.id]);
    return res;
  }

  checkNotSentNotifications() async {
    final db = await database;
    var res =
        await db.query("notifications", where: "sent = ?", whereArgs: [1]);
    if (res.isNotEmpty) {
      List<NotificationDb> list = new List<NotificationDb>();
      for (var r in res) {
        list.add(NotificationDb.fromJson(r));
      }
      await NotificationDb.sendList(list);
    }
  }

  deleteNotification(int id) async {
    final db = await database;
    db.delete("notifications", where: "id = ?", whereArgs: [id]);
  }

  deleteAllNotifications() async {
    final db = await database;
    db.rawDelete("Delete from notifications");
  }

  //endregion
  //region Map Points
  newMapPoint(MapPoint model) async {
    final db = await database;
    //get the biggest id in the table
    //insert to the table using the new id
    var raw = await db.rawInsert(
        "INSERT Into map_points(id, name_ky, name_ru, description, latitude, longitude, type)"
        " VALUES (?,?,?,?,?,?,?)",
        [
          model.id,
          model.name_ky,
          model.name_ru,
          model.description,
          model.latitude,
          model.longitude,
          model.type
        ]);
    return raw;
  }

  getMapPoint(int id) async {
    final db = await database;
    var res = await db.query("map_points", where: "id = ?", whereArgs: [id]);
    return res.isNotEmpty ? MapPoint.fromJson(res.first) : Null;
  }

  updateMapPoint(MapPoint newModel) async {
    final db = await database;
    var res = await db.update("map_points", newModel.toJson(),
        where: "id = ?", whereArgs: [newModel.id]);
    return res;
  }

  deleteMapPoint(int id) async {
    final db = await database;
    db.delete("map_points", where: "id = ?", whereArgs: [id]);
  }

  deleteAllMapPoints() async {
    final db = await database;
    db.rawDelete("Delete * from map_points");
  }

  //endregion
  //region User Moods
  newUserMood(UserMood model) async {
    final db = await database;
    var raw = await db.rawInsert(
        "INSERT Into user_moods(id, user_id, title, file_name, date_time,sent)"
        " VALUES (?,?,?,?,?,0)",
        [
          model.id,
          model.user_id,
          model.title,
          model.file_name,
          model.date_time.toString()
        ]);
    return raw;
  }

  Future<void> sendNotSentUserMoods(int userId, bool logout) async {
    _checkInternetConnection().then((value) async {
      if (value) {
        getUserMoodsBySent().then((list) {
          UserMood.sendList(list, userId).then((value) {
            for (var i in list) {
              if (!logout) {
                i.sent = 1;
                updateUserMood(i);
              }
            }
          });
        });
        if (logout) await deleteAllUserMoods();
      }
    });
  }

  newUserMood1(UserMood model) async {
    final db = await database;
    var raw = await db.rawInsert(
        "INSERT Into user_moods(id, user_id, title, file_name, date_time,sent)"
        " VALUES (?,?,?,?,?,1)",
        [
          model.id,
          model.user_id,
          model.title,
          model.file_name,
          model.date_time.toString()
        ]);
    return raw;
  }

  getUserMood(int id) async {
    final db = await database;
    var res = await db.query("user_moods", where: "id = ?", whereArgs: [id]);
    return res.isNotEmpty ? UserMood.fromJson(res.first) : Null;
  }

  Future<List<UserMood>> getAllUserMoods() async {
    final db = await database;
    List<UserMood> list = new List<UserMood>();
    return getUserId().then((value) async {
      var res = await db.query("user_moods",
          where: "user_id = ?", whereArgs: [value], orderBy: "date_time DESC");
      // var res = await db.query("user_moods", orderBy: "date_time DESC");
      for (var r in res) {
        list.add(UserMood.fromJson(r));
      }
      return list.isNotEmpty ? list : null;
    });
  }

  Future<List<UserMood>> getAllUserMoodsByDate(String currentDate) async {
    final db = await database;
    List<UserMood> list = new List<UserMood>();
    return getUserId().then((value) async {
      var res = await db.query("user_moods",
          where: "user_id = ? and date(date_time) = ?",
          whereArgs: [value, currentDate],
          orderBy: "date_time DESC");
      // var res = await db.query("user_moods", orderBy: "date_time DESC");
      for (var r in res) {
        list.add(UserMood.fromJson(r));
      }
      return list.isNotEmpty ? list : null;
    });
  }

  Future<List<UserMoodTotal>> getAllUserMoodsGroupedByTitle(int type) async {
    String queryStr = '';
    if (type == 1) {
      queryStr = "'-7 day'";
    } else if (type == 2) {
      queryStr = "'-30 day'";
    } else if (type == 3) {
      queryStr = "'-60 day'";
    } else if (type == 4) {
      queryStr = "'-90 day'";
    } else if (type == 5) {
      queryStr = "'-6 months'";
    } else {
      queryStr = "'-1 year'";
    }

    final db = await database;
    List<UserMoodTotal> list = new List<UserMoodTotal>();
    await db
        .rawQuery(
            "select s.file_name, s.title, count() as count from user_moods s where s.date_time > datetime('now'," +
                queryStr +
                ") group by s.file_name")
        .then((value) {
      for (var r in value) {
        list.add(UserMoodTotal.fromJson(r));
      }
    });

    return list;
  }

  Future<List<UserMood>> getUserMoodsBySent() async {
    final db = await database;
    var res = await db.query("user_moods");
    List<UserMood> list = new List<UserMood>();
    for (var r in res) {
      list.add(UserMood.fromJson(r));
    }
    return res.isNotEmpty ? list : null;
  }

  updateUserMood(UserMood newModel) async {
    final db = await database;
    var res = await db.update("user_moods", newModel.toJson(),
        where: "id = ?", whereArgs: [newModel.id]);
    return res;
  }

  deleteUserMood(int id) async {
    final db = await database;
    db.delete("user_moods", where: "id = ?", whereArgs: [id]);
  }

  deleteUserMoodByDate(String currentDate) async {
    final db = await database;
    db.delete("user_moods",
        where: "date(date_time) = ?", whereArgs: [currentDate]);
  }

  deleteAllUserMoods() async {
    final db = await database;
    db.rawDelete("Delete from user_moods");
  }

  //endregion
  //region User Symptoms
  newUserSymptom(UserSymptom model) async {
    final db = await database;
    var raw = await db.rawInsert(
        "INSERT Into user_symptoms(id, user_id, title, file_name, date_time, rating, sent)"
        " VALUES (?,?,?,?,?,?,?)",
        [
          model.id,
          model.user_id,
          model.title,
          model.file_name,
          model.date_time.toString(),
          model.rating,
          0
        ]);
    return raw;
  }

  Future<void> sendNotSentUserSymptoms(int userId, bool logout) async {
    _checkInternetConnection().then((value) async {
      if (value) {
        getUserSymptomsBySent().then((list) {
          UserSymptom.sendList(list, userId).then((value) {
            for (var i in list) {
              if (!logout) {
                i.sent = 1;
                updateUserSymptom(i);
              }
            }
          });
        });

        if (logout) await deleteAllUserSymptom();
      }
    });
  }

  newUserSymptom1(UserSymptom model) async {
    final db = await database;
    var raw = await db.rawInsert(
        "INSERT Into user_symptoms(id, user_id, title, file_name, date_time, rating, sent)"
        " VALUES (?,?,?,?,?,?,1)",
        [
          model.id,
          model.user_id,
          model.title,
          model.file_name,
          model.date_time.toString(),
          model.rating
        ]);
    return raw;
  }

  getUserSymptom(int id) async {
    final db = await database;
    var res = await db.query("user_symptoms", where: "id = ?", whereArgs: [id]);
    return res.isNotEmpty ? UserMood.fromJson(res.first) : Null;
  }

  Future<List<UserSymptom>> getUserSymptomsBySent() async {
    final db = await database;
    var res = await db.query("user_symptoms", orderBy: "date_time DESC");
    List<UserSymptom> list = new List<UserSymptom>();
    for (var r in res) {
      list.add(UserSymptom.fromJson(r));
    }
    return res.isNotEmpty ? list : null;
  }

  Future<List<UserSymptom>> getAllUserSymptoms() async {
    final db = await database;
    var res = await db.query("user_symptoms", orderBy: "date_time DESC");
    List<UserSymptom> list = new List<UserSymptom>();
    for (var r in res) {
      list.add(UserSymptom.fromJson(r));
    }
    return list;
  }

  Future<List<UserSymptom>> getAllUserSymptomsByDate(String currentDate) async {
    final db = await database;
    List<UserSymptom> list = new List<UserSymptom>();
    return getUserId().then((value) async {
      var res = await db.query("user_symptoms",
          where: "user_id = ? and date(date_time) = ?",
          whereArgs: [value, currentDate],
          orderBy: "date_time DESC");
      for (var r in res) {
        list.add(UserSymptom.fromJson(r));
      }
      return list.isNotEmpty ? list : null;
    });
  }

  Future<List<UserSymptomTotal>> getAllGroupedByTitle(int type) async {
    String queryStr = '';
    if (type == 1) {
      queryStr = "'-7 day'";
    } else if (type == 2) {
      queryStr = "'-30 day'";
    } else if (type == 3) {
      queryStr = "'-60 day'";
    } else if (type == 4) {
      queryStr = "'-90 day'";
    } else if (type == 5) {
      queryStr = "'-6 months'";
    } else {
      queryStr = "'-1 year'";
    }

    final db = await database;
    List<UserSymptomTotal> list = new List<UserSymptomTotal>();
    await db
        .rawQuery(
            "select s.file_name, s.title, count() as count from user_symptoms s where s.date_time > datetime('now'," +
                queryStr +
                ") group by s.title")
        .then((value) {
      for (var r in value) {
        list.add(UserSymptomTotal.fromJson(r));
      }
    });
    return list;
  }

  updateUserSymptom(UserSymptom newModel) async {
    final db = await database;
    var res = await db.update("user_symptoms", newModel.toJson(),
        where: "id = ?", whereArgs: [newModel.id]);
    return res;
  }

  deleteUserSymptom(int id) async {
    final db = await database;
    db.delete("user_symptoms", where: "id = ?", whereArgs: [id]);
  }

  deleteAllUserSymptom() async {
    final db = await database;
    db.rawDelete("Delete from user_symptoms");
  }

  deleteUserSymptomsByDate(String currentDate) async {
    final db = await database;
    db.delete("user_symptoms",
        where: "date(date_time) = ?", whereArgs: [currentDate]);
  }

  //endregion
  //region User Images
  newUserImage(UserImageFile model) async {
    final db = await database;
    var raw = await db.rawInsert(
        "INSERT Into user_images(id, user_id, path, file_name, date_time, type, sent)"
        " VALUES (?,?,?,?,?,?,0)",
        [
          model.id,
          model.user_id,
          model.path,
          model.file_name,
          model.date_time.toString(),
          model.type
        ]);
    await sendNotSentUserImages(model.user_id, false);
    return raw;
  }

  sendNotSentUserImages(int user_id, bool logout) async {
    _checkInternetConnection().then((value) async {
      if (value) {
        getUserImageFilesBySent().then((list) {
          UserImageFile.sendList(list, user_id).then((value) {
            for (var i in list) {
              i.sent = 1;
              updateUserImage(i);
            }
          });
        });
        if (logout) deleteAllUserImage();
      }
    });
  }

  newUserImage1(UserImageFile model) async {
    final db = await database;
    var raw = await db.rawInsert(
        "INSERT Into user_images(id, user_id, path, file_name, date_time, type, sent)"
        " VALUES (?,?,?,?,?,?,1)",
        [
          model.id,
          1,
          model.path,
          model.file_name,
          model.date_time.toString(),
          model.type
        ]);
    return raw;
  }

  getUserImage(int id) async {
    final db = await database;
    var res = await db.query("user_images", where: "id = ?", whereArgs: [id]);
    return res.isNotEmpty ? UserMood.fromJson(res.first) : Null;
  }

  Future<List<UserImageFile>> getAllUserImages(int type) async {
    final db = await database;
    var res = await db.query("user_images",
        orderBy: "date_time DESC", where: "type = ?", whereArgs: [type]);
    List<UserImageFile> list = new List<UserImageFile>();
    for (var r in res) {
      list.add(UserImageFile.fromJson(r));
    }
    return list;
  }

  Future<List<UserImageFile>> getUserImageFiles() async {
    final db = await database;
    var res = await db.query("user_images");
    List<UserImageFile> list = new List<UserImageFile>();
    for (var r in res) {
      list.add(UserImageFile.fromJson(r));
    }
    return list;
  }

  Future<List<UserImageFile>> getUserImageFilesBySent() async {
    final db = await database;
    var res = await db.query("user_images", where: "sent = ?", whereArgs: [0]);
    List<UserImageFile> list = new List<UserImageFile>();
    for (var r in res) {
      list.add(UserImageFile.fromJson(r));
    }
    return res.isNotEmpty ? list : null;
  }

  updateUserImage(UserImageFile newModel) async {
    final db = await database;
    var res = await db.update("user_images", newModel.toJson(),
        where: "id = ?", whereArgs: [newModel.id]);
    return res;
  }

  Future deleteUserImage(int id) async {
    try {
      final db = await database;
      db.delete("user_images", where: "id = ?", whereArgs: [id]);
    } catch (e) {
      return false;
    }
    return true;
  }

  deleteAllUserImage() async {
    final db = await database;
    await getUserImageFiles().then((value) {
      for (var i in value) {
        var file = new File(i.path);
        file.delete(recursive: true);
      }
      db.rawDelete("Delete from user_images");
    });
  }

//endregion
  //region Audio Files
  Future<int> newAudioFile(AudioDb model) async {
    final db = await database;
    //get the biggest id in the table
    //insert to the table using the new id
    var raw = await db.insert("audio_files", model.toJson());
    return raw;
  }

  getAudioFile(int id) async {
    final db = await database;
    var res = await db.query("audio_files", where: "id = ?", whereArgs: [id]);
    return res.isNotEmpty ? AudioDb.fromJson(res.first) : Null;
  }

  Future<List<AudioDb>> getAllAudioFiles() async {
    final db = await database;
    var res = await db.query("audio_files", orderBy: "id DESC");
    List<AudioDb> list = new List<AudioDb>();
    for (var r in res) {
      list.add(AudioDb.fromJson(r));
    }
    return list;
  }

  Future<List<String>> getAudioFilesGroupByCategories() async {
    final db = await database;
    var res = await db.rawQuery(
        "select s.category_name from audio_files s group by s.category_name");
    List<String> list = new List<String>();
    for (var r in res) {
      list.add(r['category_name'].toString());
    }
    return list;
  }

  Future<List<AudioDb>> getAudioFilesByCategories(String category_name) async {
    final db = await database;
    var res = await db.query('audio_files',
        where: 'category_name = ?', whereArgs: [category_name]);
    List<AudioDb> list = new List<AudioDb>();
    for (var r in res) {
      list.add(AudioDb.fromJson(r));
    }
    return list;
  }

  updateAudioFile(AudioDb newModel) async {
    final db = await database;
    var res = await db.update("audio_files", newModel.toJson(),
        where: "id = ?", whereArgs: [newModel.id]);
    return res;
  }

  deleteAudioFile(int id) async {
    final db = await database;
    db.delete("audio_files", where: "id = ?", whereArgs: [id]);
  }

  deleteAllAudioFiles() async {
    final db = await database;
    db.rawDelete("Delete from audio_files");
  }
}
