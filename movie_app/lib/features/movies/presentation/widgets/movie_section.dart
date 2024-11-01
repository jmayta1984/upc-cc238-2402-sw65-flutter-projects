import 'package:flutter/material.dart';
import 'package:movie_app/core/movie_enum.dart';
import 'package:movie_app/features/movies/presentation/widgets/movie_list.dart';

class MovieSection extends StatelessWidget {
  const MovieSection({super.key, required this.section});
  final MovieEnum section;

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  section.name,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 30),
                ),
                SizedBox(height: 275, child: MovieList(path: section.path))
              ],
            )));
  }
}
