import 'dart:convert';
import 'dart:io';

import 'package:movie_app/core/app_constants.dart';
import 'package:movie_app/features/movies/data/remote/movie_dto.dart';
import 'package:http/http.dart' as http;

class MovieService {
  Future<List<MovieDto>> getMovies(String path, int page) async {
    String url =
        '${AppConstants.baseUrl}${AppConstants.moviePath}$path${AppConstants.apiKeyQuery}${AppConstants.pageQuery}$page';

    try {
      http.Response response = await http.get(Uri.parse(url));

      if (response.statusCode == HttpStatus.ok) {
        dynamic jsonData = jsonDecode(response.body);

        List results = jsonData['results'];

        return results.map((json) => MovieDto.fromJson(json)).toList();
      }
      return [];
    } catch (error) {
      return [];
    }
  }
}