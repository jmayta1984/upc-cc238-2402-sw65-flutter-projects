import 'package:flutter/material.dart';
import 'package:newsly/shared/data/local/app_database.dart';
import 'package:newsly/shared/data/local/favorite_news_dao.dart';
import 'package:newsly/shared/data/local/favorite_news_model.dart';

class FavoriteNewsPage extends StatefulWidget {
  const FavoriteNewsPage({super.key});

  @override
  State<FavoriteNewsPage> createState() => _FavoriteNewsPageState();
}

class _FavoriteNewsPageState extends State<FavoriteNewsPage> {
  final TextEditingController _controller = TextEditingController();
  List<FavoriteNewsModel> _news = [];
  List<FavoriteNewsModel> _favoriteNews = [];

  Future<void> loadData() async {
    List<FavoriteNewsModel> favorites = await FavoriteNewsDao(appDatabase: AppDatabase()).fetchAllFavoriteNews();
    setState(() {
      _news = favorites;
      _favoriteNews = favorites;
    });
  }

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 4.0, right: 4.0),
          child: TextField(
            onChanged: (value) {
              setState(() {
                _favoriteNews = _news.where((element) {
                  return element.title.contains(value);
                }).toList();
              });
            },
            controller: _controller,
            decoration: const InputDecoration(
                prefixIcon: Icon(Icons.search), border: OutlineInputBorder()),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: _favoriteNews.length,
            itemBuilder: (context, index) {
              return Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Hero(
                      tag: _favoriteNews[index].title,
                      child: Image.network(
                        _news[index].image,
                        errorBuilder: (context, error, stackTrace) {
                          return const SizedBox(
                            height: 150,
                            child: Center(child: Text("No image found.")),
                          );
                        },
                        height: 150,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Text(
                      _favoriteNews[index].title,
                      maxLines: 1,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Text(_favoriteNews[index].author),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                            onPressed: () {
                              setState(() {
                                _news.remove(_favoriteNews[index]);
                              });
                            },
                            icon: const Icon(Icons.remove_circle_outline)),
                      ],
                    )
                  ],
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
