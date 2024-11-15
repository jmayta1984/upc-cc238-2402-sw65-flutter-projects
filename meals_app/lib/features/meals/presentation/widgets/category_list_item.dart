import 'package:flutter/material.dart';
import 'package:meals_app/features/meals/domain/category.dart';

class CategoryListItem extends StatelessWidget {
  const CategoryListItem({super.key, required this.category});
  final Category category;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(
            category.image,
            fit: BoxFit.cover,
            height: 140,
            width: double.infinity,
          ),
          Text(category.name),
        ],
      ),
    );
  }
}
