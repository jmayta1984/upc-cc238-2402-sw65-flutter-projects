import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:newsly/domain/news.dart';

class NewsService {
  final baseUrl = 'https://dev.formandocodigo.com/articles.php?description=';

  Future<List<News>> getNews(String query) async {
    Uri uri = Uri.parse('$baseUrl$query');
    http.Response response = await http.get(uri);
    if (response.statusCode == HttpStatus.ok) {
      List maps = jsonDecode(response.body);
      return maps.map((json) => News.fromJson(json)).toList();
    }
    return [];
  }
  
}