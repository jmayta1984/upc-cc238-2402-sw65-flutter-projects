import 'package:flutter/material.dart';
import 'package:movie_app/core/movie_enum.dart';
import 'package:movie_app/features/movies/presentation/widgets/movie_section.dart';

class MoviesPage extends StatefulWidget {
  const MoviesPage({super.key});

  @override
  State<MoviesPage> createState() => _MoviesPageState();
}

class _MoviesPageState extends State<MoviesPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(MovieEnum.values.length, (index) {
            return MovieSection(section: MovieEnum.values[index]);
          })),
    );
  }
}
