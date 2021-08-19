import 'dart:convert';

class Consultation {
  int id;
  int consultant_id;
  String name_ky;
  String name_ru;
  String whatsapp;
  String telegram;
  String facebook;
  String messenger;
  String phone_number;
  double latitude;
  double longitude;


  Consultation(
      {this.id,
      this.consultant_id,
      this.name_ky,
      this.name_ru,
      this.whatsapp,
      this.telegram,
      this.facebook,
      this.messenger,
      this.phone_number,
      this.latitude,
      this.longitude});

  factory Consultation.fromJson(Map<String, dynamic> json) => new Consultation(
    id: json["id"],
    consultant_id: json["consultant_id"],
    name_ky: json["name_ky"],
    name_ru: json["name_ru"],
    whatsapp: json["whatsapp"],
    telegram: json["telegram"],
    facebook: json["facebook"],
    messenger: json["messenger"],
    phone_number: json["phone_number"],
    latitude: json["latitude"],
    longitude: json["longitude"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "consultant_id": consultant_id,
    "name_ky": name_ky,
    "name_ru": name_ru,
    "whatsapp": whatsapp,
    "telegram": telegram,
    "facebook": facebook,
    "messenger": messenger,
    "phone_number": phone_number,
    "latitude": latitude,
    "longitude": longitude,
  };
}
Consultation consultationFromJson(String str) {
  final jsonData = json.decode(str);
  return Consultation.fromJson(jsonData);
}

String consultationToJson(Consultation data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}