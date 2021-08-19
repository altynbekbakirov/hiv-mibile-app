import 'dart:convert';

class Mood {
  int id;
  String name_ky;
  String name_ru;
  String image_name;

  Mood({this.id, this.name_ky, this.name_ru, this.image_name});

  factory Mood.fromJson(Map<String, dynamic> json) => new Mood(
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
Mood moodFromJson(String str) {
  final jsonData = json.decode(str);
  return Mood.fromJson(jsonData);
}

String moodToJson(Mood data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}