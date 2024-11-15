import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:meals_app/core/app_constants.dart';
import 'package:meals_app/features/meals/data/remote/meal_dto.dart';
import 'package:meals_app/features/meals/domain/meal.dart';

class MealService {
  Future<List<Meal>> getMeals(String category) async {
    String url = '${AppConstants.baseUrl}${AppConstants.filterPath}${AppConstants.categoryQuery}$category';

    try {
      http.Response response = await http.get(Uri.parse(url));
      if (response.statusCode == HttpStatus.ok) {
        final json = jsonDecode(response.body);
        List maps = json['meals'];
        return (maps.map((map) => MealDto.fromJson(map).toDomain()).toList());
      }
      return [];
    } catch (error) {
      return [];
    }
  }
}
