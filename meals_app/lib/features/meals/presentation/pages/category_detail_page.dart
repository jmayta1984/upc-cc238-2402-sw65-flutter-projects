import 'package:flutter/material.dart';
import 'package:meals_app/features/meals/data/remote/meal_service.dart';
import 'package:meals_app/features/meals/domain/category.dart';
import 'package:meals_app/features/meals/domain/meal.dart';
import 'package:meals_app/features/meals/presentation/widgets/meal_list.dart';

class CategoryDetailPage extends StatefulWidget {
  const CategoryDetailPage({super.key, required this.category});
  final Category category;

  @override
  State<CategoryDetailPage> createState() => _CategoryDetailPageState();
}

class _CategoryDetailPageState extends State<CategoryDetailPage> {
  List<Meal> _meals = [];

  Future<void> _loadData() async {
    List<Meal> meals = await MealService().getMeals(widget.category.name);

    setState(() {
      _meals = meals;
    });
  }

  @override
  void initState() {
    _loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Category category = widget.category;
    return Scaffold(
      body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
                SliverAppBar(
                  pinned: true,
                  expandedHeight: 200,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Image.network(
                      category.image,
                      width: double.infinity,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              ],
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  category.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
                Text(category.description),
                MealList(meals: _meals)
              ],
            ),
          )),
    );
  }
}
