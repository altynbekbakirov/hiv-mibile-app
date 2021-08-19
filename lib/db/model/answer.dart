import 'dart:convert';

class Answer {
  int id;
  String name_ky;
  String name_ru;
  int question_id;

  Answer({this.id, this.name_ky, this.name_ru, this.question_id});

  factory Answer.fromJson(Map<String, dynamic> json) => new Answer(
    id: json["id"],
    name_ky: json["name_ky"],
    name_ru: json["name_ru"],
    question_id: json["question_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name_ky": name_ky,
    "name_ru": name_ru,
    "question_d": question_id,
  };
}
Answer answerFromJson(String str) {
  final jsonData = json.decode(str);
  return Answer.fromJson(jsonData);
}

String answerToJson(Answer data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}