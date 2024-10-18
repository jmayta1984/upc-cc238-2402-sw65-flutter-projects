import 'package:flutter/material.dart';
import 'package:newsly/domain/news.dart';
import 'package:newsly/presentation/news_detail/news_details_screen.dart';

class SearchNewsPage extends StatefulWidget {
  const SearchNewsPage({super.key});

  @override
  State<SearchNewsPage> createState() => _SearchNewsPageState();
}

class _SearchNewsPageState extends State<SearchNewsPage> {
  final TextEditingController _controller = TextEditingController();
  List<News> _news = [];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    List maps = await loadJsonFromAssets('assets/articles.json');
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
              return Padding(
                padding: const EdgeInsets.all(4.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              NewsDetailsScreen(news: _news[index]),
                        ));
                  },
                  child: Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Hero(
                            tag: _news[index].title,
                            child: Image.network(
                              _news[index].urlToImage,
                              width: double.infinity,
                              height: 150,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                          child: Text(
                            _news[index].title,
                            maxLines: 1,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                          child: Text(_news[index].author),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(_news[index].description, maxLines: 3),
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
