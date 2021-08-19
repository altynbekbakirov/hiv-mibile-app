import 'dart:convert';

class Question {
  int id;
  String name_ky;
  String name_ru;
  int category_id;

  Question({this.id, this.name_ky, this.name_ru, this.category_id});

  factory Question.fromJson(Map<String, dynamic> json) => new Question(
    id: json["id"],
    name_ky: json["name_ky"],
    name_ru: json["name_ru"],
    category_id: json["category_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name_ky": name_ky,
    "name_ru": name_ru,
    "category_d": category_id,
  };
}
Question questionFromJson(String str) {
  final jsonData = json.decode(str);
  return Question.fromJson(jsonData);
}

String questionToJson(Question data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}