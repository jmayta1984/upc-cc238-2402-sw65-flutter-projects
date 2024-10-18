import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

class NewsService {
  final baseUrl = 'https://dev.formandocodigo.com/articles.php?description=';

  getNews(String query) async {
    Uri uri = Uri.parse('$baseUrl$query');
    http.Response response = await http.get(uri);
    if (response.statusCode == HttpStatus.ok) {
      jsonDecode(response.body);
    }
  }
  
}