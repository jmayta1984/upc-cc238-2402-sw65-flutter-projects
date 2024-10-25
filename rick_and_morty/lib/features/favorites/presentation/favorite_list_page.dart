import 'package:flutter/material.dart';
import 'package:rick_and_morty/features/favorites/data/local/favorite_dao.dart';
import 'package:rick_and_morty/features/favorites/data/local/favorite_model.dart';

class FavoriteListPage extends StatefulWidget {
  const FavoriteListPage({super.key});

  @override
  State<FavoriteListPage> createState() => _FavoriteListPageState();
}

class _FavoriteListPageState extends State<FavoriteListPage> {
  List<FavoriteModel> _favorites = [];

  void _loadData() async {
    List<FavoriteModel> favorites = await FavoriteDao().fetchAllFavorites();
    setState(() {
      _favorites = favorites;
    });
  }

  @override
  void initState() {
    _loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _favorites.length,
      itemBuilder: (context, index) => Text(_favorites[index].name),
    );
  }
}
