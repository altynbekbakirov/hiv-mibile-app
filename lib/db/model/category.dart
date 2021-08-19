import 'dart:convert';

class Category {
  int id;
  String name_ky;
  String name_ru;

  Category({this.id, this.name_ky, this.name_ru});

  factory Category.fromJson(Map<String, dynamic> json) => new Category(
    id: json["id"],
    name_ky: json["name_ky"],
    name_ru: json["name_ru"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name_ky": name_ky,
    "name_ru": name_ru,
  };
}
Category categoryFromJson(String str) {
  final jsonData = json.decode(str);
  return Category.fromJson(jsonData);
}

String categoryToJson(Category data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}