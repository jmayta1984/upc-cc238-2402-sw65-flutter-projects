import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:newsly/shared/domain/entities/news.dart';

class NewsService {
  final String _baseUrl = 'https://dev.formandocodigo.com/articles.php?description=';

  Future<List<News>> searchNews(String query) async {
     http.Response response = await http.get(Uri.parse('$_baseUrl$query'));
     if (response.statusCode == HttpStatus.ok){
        List maps = jsonDecode(response.body);

        return maps.map((element) => News.fromJson(element)).toList();
     }
     return [];
  }

}