import 'package:flutter/material.dart';
import 'package:meals_app/features/meals/data/remote/meal_service.dart';
import 'package:meals_app/features/meals/domain/category.dart';
import 'package:meals_app/features/meals/domain/meal.dart';

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
                  expandedHeight: 100,
                  flexibleSpace: FlexibleSpaceBar(
                    title: Text(category.name),
                    background: Image.network(
                      category.image,
                      width: double.infinity,
                      height: 400,
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              ],
          body: ListView.builder(
            itemCount: _meals.length,
            itemBuilder: (context, index) => Card(
              child: ListTile(
                leading: Image.network(_meals[index].image),
                title: Text(_meals[index].name),
              ),
            ),
          )),
    );
  }
}
