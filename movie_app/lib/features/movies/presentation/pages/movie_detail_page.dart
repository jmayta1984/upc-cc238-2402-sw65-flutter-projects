import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:movie_app/features/movies/domain/movie.dart';

class MovieDetailPage extends StatelessWidget {
  const MovieDetailPage({super.key, required this.movie});
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                floating: true,
                pinned: true,
                expandedHeight: 500,
                flexibleSpace: FlexibleSpaceBar(
                  background: Image.network(
                    movie.posterPath,
                    width: double.infinity,
                    height: 500,
                    fit: BoxFit.cover,
                  ),
                ),
              )
            ];
          },
          body: SingleChildScrollView(
            child: Column(
              children: [Text(movie.title), Icon(Icons.bookmark_border)],
            ),
          )),
    );
  }
}
