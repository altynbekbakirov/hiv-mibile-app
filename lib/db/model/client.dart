import 'dart:convert';

import 'package:hiv/db/db_provider.dart';
import 'package:sqflite/sqflite.dart';

Client clientFromJson(String str) {
  final jsonData = json.decode(str);
  return Client.fromJson(jsonData);
}

String clientToJson(Client data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}
class Client {
  int id;
  String firstName;
  String lastName;

  Client({
    this.id,
    this.firstName,
    this.lastName,
  }){
  }

  factory Client.fromJson(Map<String, dynamic> json) => new Client(
    id: json["id"],
    firstName: json["first_name"],
    lastName: json["last_name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "first_name": firstName,
    "last_name": lastName,
  };

}