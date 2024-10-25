import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:newsly/shared/domain/entities/news.dart';

Future loadJsonFromAssets(String filePath) async {

  String jsonString = await rootBundle.loadString(filePath);

  return jsonDecode(jsonString);

}



Future<List<News>> loadData() async {

  List maps = await loadJsonFromAssets('assets/articles.json');

  return maps.map((map) => News.fromJson(map)).toList();

}



Future<List<News>> loadDataFromJson() async {

  List maps = await loadJsonFromAssets('assets/articles.json');

  return maps.map((map) => News.fromJson(map)).toList();

}