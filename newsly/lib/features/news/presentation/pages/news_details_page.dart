import 'package:flutter/material.dart';
import 'package:newsly/features/news/presentation/widgets/news_image.dart';
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
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              expandedHeight: height * 0.35,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                background: Hero(
                  tag: widget.news.title,
                  child: NewsImage(
                    url: widget.news.urlToImage,
                    height: height * 0.35,
                    width: double.infinity,
                  ),
                ),
              ),
            )
          ];
        },
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  widget.news.title,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(widget.news.author),
              ),
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
            ],
          ),
        ),
      ),
    );
  }
}
