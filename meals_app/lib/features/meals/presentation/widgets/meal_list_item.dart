import 'package:flutter/material.dart';
import 'package:meals_app/features/meals/domain/meal.dart';

class MealListItem extends StatefulWidget {
  const MealListItem({super.key, required this.meal});
  final Meal meal;

  @override
  State<MealListItem> createState() => _MealListItemState();
}

class _MealListItemState extends State<MealListItem> {
  bool _isFavorite = false;

  @override
  Widget build(BuildContext context) {
    Meal meal = widget.meal;
    return Card(
        child: Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(
            meal.image,
            width: 60,
            height: 60,
            fit: BoxFit.cover,
          ),
        ),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            meal.name,
            softWrap: false,
            overflow: TextOverflow.ellipsis,
          ),
        )),
        IconButton(
            onPressed: () {
              setState(() {
                _isFavorite = !_isFavorite;
              });
            },
            icon: Icon(_isFavorite ? Icons.favorite : Icons.favorite_border))
      ],
    ));
  }
}
