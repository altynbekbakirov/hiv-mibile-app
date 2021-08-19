import 'dart:convert';

class Symptom {
  int id;
  String name_ky;
  String name_ru;
  String image_name;

  Symptom({this.id, this.name_ky, this.name_ru, this.image_name});

  factory Symptom.fromJson(Map<String, dynamic> json) => new Symptom(
    id: json["id"],
    name_ky: json["name_ky"],
    name_ru: json["name_ru"],
    image_name: json["image_name"]
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name_ky": name_ky,
    "name_ru": name_ru,
    "image_name": image_name,
  };
}
Symptom symptomFromJson(String str) {
  final jsonData = json.decode(str);
  return Symptom.fromJson(jsonData);
}

String symptomToJson(Symptom data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}