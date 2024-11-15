import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:meals_app/core/app_constants.dart';
import 'package:meals_app/features/meals/data/remote/category_dto.dart';
import 'package:meals_app/features/meals/domain/category.dart';

class CategoryService {
  Future<List<Category>> getCategories() async {
    String url = '${AppConstants.baseUrl}${AppConstants.categoryPath}';

    try {
      http.Response response = await http.get(Uri.parse(url));
      if (response.statusCode == HttpStatus.ok) {
        final json = jsonDecode(response.body);
        List maps = json['categories'];
        return (maps
            .map((map) => CategoryDto.fromJson(map).toDomain())
            .toList());
      }
      return [];
    } catch (error) {
      return [];
    }
  }
}
