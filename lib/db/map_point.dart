import 'dart:convert';

class MapPoint {
  int id;
  String name_ky;
  String name_ru;
  String description;
  double latitude;
  double longitude;
  int type;


  MapPoint(
      {this.id,
      this.name_ky,
      this.name_ru,
      this.description,
      this.latitude,
      this.longitude,
      this.type});

  factory MapPoint.fromJson(Map<String, dynamic> json) => new MapPoint(
      id: json["id"],
      name_ky: json["name_ky"],
      name_ru: json["name_ru"],
      description: json["description"],
      latitude: json["latitude"],
      longitude: json["longitude"],
      type: json["type"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name_ky": name_ky,
    "name_ru": name_ru,
    "description": description,
    "latitude": latitude,
    "longitude": longitude,
    "type": type,
  };
}
MapPoint mapPointFromJson(String str) {
  final jsonData = json.decode(str);
  return MapPoint.fromJson(jsonData);
}

String mapPointToJson(MapPoint data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}