import 'dart:convert';

import 'package:flutter/services.dart';

class News {
  String author;
  String title;
  String description;
  String url;
  String urlToImage;
  String publishedAt;
  String content;

  News(
      {required this.author,
      required this.title,
      required this.description,
      required this.url,
      required this.urlToImage,
      required this.publishedAt,
      required this.content});

  News.fromJson(Map<String, dynamic> json)
      : author = json['author'] ?? '',
        title = json['title'] ?? '',
        description = json['description'] ?? '',
        url = json['url'] ?? '',
        urlToImage = json['urlToImage'] ?? '',
        publishedAt = json['publishedAt'] ?? '',
        content = json['content'] ?? '';
}

Future<List> loadJsonFromAssets(String filePath) async {
  String jsonString = await rootBundle.loadString(filePath);
  return jsonDecode(jsonString);
}
