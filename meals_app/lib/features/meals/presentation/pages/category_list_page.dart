import 'package:flutter/material.dart';
import 'package:meals_app/features/meals/data/remote/category_service.dart';
import 'package:meals_app/features/meals/domain/category.dart';
import 'package:meals_app/features/meals/presentation/pages/category_detail_page.dart';
import 'package:meals_app/features/meals/presentation/widgets/category_list_item.dart';

class CategoryListPage extends StatefulWidget {
  const CategoryListPage({super.key});

  @override
  State<CategoryListPage> createState() => _CategoryListPageState();
}

class _CategoryListPageState extends State<CategoryListPage> {
  List<Category> _categories = [];

  Future<void> _loadData() async {
    List<Category> categories = await CategoryService().getCategories();
    setState(() {
      _categories = categories;
    });
  }

  @override
  void initState() {
    _loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: _categories.length,
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      CategoryDetailPage(category: _categories[index]),
                ));
          },
          child: CategoryListItem(category: _categories[index])),
    );
  }
}
