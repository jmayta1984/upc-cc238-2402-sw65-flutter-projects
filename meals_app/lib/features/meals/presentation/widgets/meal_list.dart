import 'package:flutter/material.dart';
import 'package:meals_app/features/meals/domain/meal.dart';
import 'package:meals_app/features/meals/presentation/widgets/meal_list_item.dart';

class MealList extends StatelessWidget {
  const MealList({super.key, required this.meals});
  final List<Meal> meals;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.only(bottom: 40),
      itemCount: meals.length,
      itemBuilder: (context, index) => MealListItem(meal: meals[index]),
    );
  }
}
