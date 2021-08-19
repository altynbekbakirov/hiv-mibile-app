import 'dart:convert';

import 'package:HIVApp/data/configs.dart';
import 'package:http/http.dart' as http;

class VideoModel {
  String title;
  String video_url;

  VideoModel({this.title, this.video_url});

  Future<void> getVideos(String lang) async {
    final url =
        Configs.ip+'api/login';
    try {
      Map<String, String> headers = {"Content-type": "application/json"};
      final response = await http.post(
        url,
        headers:headers,
        body: json.encode(
            {"lang": lang}),
      );
      final responseData = json.decode(response.body);

      if(responseData != null) {

      }
    }
    catch (error) {
      throw error;
    }
  }
}