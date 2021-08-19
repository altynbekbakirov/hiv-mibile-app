class AudioDb {
  int id;
  String local_path;
  String remote_path;
  String title;
  String category_name;

  AudioDb({this.id, this.local_path, this.remote_path, this.title, this.category_name});

  factory AudioDb.fromJson(Map<String, dynamic> json) => new AudioDb(
    id: json["id"],
    local_path: json["local_path"],
    remote_path: json["remote_path"],
    category_name: json["category_name"],
    title: json["title"]
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "local_path": local_path,
    "remote_path": remote_path,
    "title": title,
    "category_name": category_name,
  };
}