import 'dart:convert';

import 'package:hiv/data/configs.dart';
import 'package:hiv/db/db_provider.dart';
import 'package:http/http.dart' as http;

class RatingModel {
  int id;
  int consultantId;
  String consultantName;
  int userId;
  String userName;
  num rating;

  RatingModel(
      {this.id,
      this.consultantId,
      this.consultantName,
      this.userId,
      this.userName,
      this.rating});

  Map<String, dynamic> toJson() => {
        RatingFields.id: id,
        RatingFields.consultantId: consultantId,
        RatingFields.consultantName: consultantName,
        RatingFields.userId: userId,
        RatingFields.userName: userName,
        RatingFields.rating: rating
      };

  static RatingModel fromJson(Map<String, dynamic> json) => RatingModel(
      id: json[RatingFields.id],
      consultantId: json[RatingFields.consultantId],
      consultantName: json[RatingFields.consultantName],
      userId: json[RatingFields.userId],
      userName: json[RatingFields.userName],
      rating: json[RatingFields.rating]);

  @override
  String toString() {
    return 'RatingModel{id: $id, consultantId: $consultantId, consultantName: $consultantName, userId: $userId, userName: $userName, rating: $rating}';
  }

  static Future getList() async {
    await DBProvider.db.getUser().then((value) async {
      final url =
          Configs.ip+'api/consultants_ratings/'+value.id.toString();
      try {
        Map<String, String> headers = {"Content-type": "application/json", "token": value.token};
        final response = await http.get(
          url,
          headers:headers,
        );
        saveListToDatabase(json.decode(response.body));
      }
      catch (error) {
        throw error;
      }
    });
  }

  static List<RatingModel> saveListToDatabase(var responseBody){
    List<RatingModel> list = new List<RatingModel>();
    for(var i in responseBody){
      RatingModel model = new RatingModel();

      model.id = i[RatingFields.id];
      model.consultantId = i[RatingFields.consultantId];
      model.consultantName = i[RatingFields.consultantName];
      model.userId = i[RatingFields.userId];
      model.userName = i[RatingFields.userName];
      model.rating = i[RatingFields.rating];

      DBProvider.db.insertRating(model);
      list.add(model);
    }
    return list;
  }

}

final String ratingTable = 'ratings';

class RatingFields {
  static final String id = 'id';
  static final String consultantId = 'consultant_id';
  static final String consultantName = 'consultant_name';
  static final String userId = 'user_id';
  static final String userName = 'user_name';
  static final String rating = 'rating';
}
