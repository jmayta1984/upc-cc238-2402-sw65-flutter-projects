import 'package:flutter/material.dart';
import 'package:newsly/news.dart';

class SearchNews extends StatefulWidget {
  const SearchNews({super.key});

  @override
  State<SearchNews> createState() => _SearchNewsState();
}

class _SearchNewsState extends State<SearchNews> {
  final TextEditingController _controller = TextEditingController();
  List<News> _news = [];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    List maps =
        await loadJsonFromAssets('assets/articles.json');
    setState(() {
      _news = maps.map((map) => News.fromJson(map)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
          child: TextField(
            controller: _controller,
            decoration: InputDecoration(
                hintText: 'Search news',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16))),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: _news.length,
            itemBuilder: (context, index) {
              return Card(
                child: Column(
                  children: [
                    Image.network(_news[index].urlToImage),
                    Text(_news[index].author),
                    Text(_news[index].title),
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
