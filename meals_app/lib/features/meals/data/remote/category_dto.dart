import 'package:meals_app/features/meals/domain/category.dart';

class CategoryDto {
  final String id;
  final String name;
  final String description;
  final String image;

  CategoryDto({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
  });

  factory CategoryDto.fromJson(Map<String, dynamic> json) {
    return CategoryDto(
      id: json['idCategory'] ?? '',
      name: json['strCategory'] ?? '',
      image: json['strCategoryThumb'] ?? '',
      description: json['strCategoryDescription'] ?? '',
    );
  }

  Category toDomain() {
    return Category(
      id: id,
      name: name,
      image: image,
      description: description,
    );
  }
}
