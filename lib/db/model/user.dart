import 'dart:convert';

class DbUser {
  int id;
  String username;
  String password;
  String pin_code;
  String token;

  DbUser({this.id, this.username, this.password, this.token, this.pin_code});

  factory DbUser.fromJson(Map<String, dynamic> json) => new DbUser(
    id: json["id"],
    token: json["token"],
    username: json["username"],
    password: json["password"],
    pin_code: json["pin_code"],
  );

  Map<String, dynamic> toJson() => {
    "username": username,
    "password": password,
    "pin_code": pin_code
  };
}

DbUser userFromJson(String str) {
  final jsonData = json.decode(str);
  return DbUser.fromJson(jsonData);
}

String userToJson(DbUser data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}