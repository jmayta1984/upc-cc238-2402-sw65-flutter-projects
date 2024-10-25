import 'dart:convert';
import 'dart:io';

import 'package:newsly/core/constants/app_constants.dart';
import 'package:newsly/shared/domain/entities/news.dart';
import 'package:http/http.dart' as http;

class NewsService {
  Future<List<News>> searchNews(String query) async {
    final url = Uri.parse(
        '${AppConstants.baseUrl}${AppConstants.articles}?description=$query');

    http.Response response = await http.get(url);
    if (response.statusCode == HttpStatus.ok) {
      List maps = jsonDecode(response.body);
      return maps.map((json) => News.fromJson(json)).toList();
    }

    return [];
  }
}
