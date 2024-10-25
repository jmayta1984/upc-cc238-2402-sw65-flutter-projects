import 'package:flutter/material.dart';
import 'package:newsly/shared/domain/entities/news.dart';

class NewsDetailsPage extends StatefulWidget {
  const NewsDetailsPage({super.key, required this.news});
  final News news;

  @override
  State<NewsDetailsPage> createState() => _NewsDetailsPageState();
}

class _NewsDetailsPageState extends State<NewsDetailsPage> {
  bool _isFavorite = false;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              floating: true,
              pinned: true,
              expandedHeight: height * 0.4,
              flexibleSpace: FlexibleSpaceBar(
                background: Hero(
                  tag: widget.news.title,
                  child: Image.network(
                    widget.news.urlToImage,
                    height: height * 0.4,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            )
          ];
        },
        body: SingleChildScrollView(
          child: Column(children: [
            Text(
              widget.news.title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            Text(widget.news.author),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(widget.news.content),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton.outlined(
                    onPressed: () {}, icon: const Icon(Icons.web)),
                IconButton.outlined(
                    onPressed: () {
                      setState(() {
                        _isFavorite = !_isFavorite;
                      });
                    },
                    icon: const Icon(Icons.favorite),
                    color: _isFavorite
                        ? ThemeData().primaryColor
                        : ThemeData().hintColor)
              ],
            )
          ]),
        ),
      ),
    );
  }
}
