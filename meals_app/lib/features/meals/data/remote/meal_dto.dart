import 'package:meals_app/features/meals/domain/meal.dart';

class MealDto {
  final String id;
  final String name;
  final String image;

  MealDto({
    required this.id,
    required this.name,
    required this.image,
  });

  factory MealDto.fromJson(Map<String, dynamic> json) {
    return MealDto(
      id: json['idMeal'] ?? '',
      name: json['strMeal'] ?? '',
      image: json['strMealThumb'] ?? '',
    );
  }

  Meal toDomain() {
    return Meal(
      id: id,
      name: name,
      image: image,
    );
  }
}