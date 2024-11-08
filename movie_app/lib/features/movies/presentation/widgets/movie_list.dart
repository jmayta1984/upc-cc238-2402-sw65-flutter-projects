import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:movie_app/core/app_constants.dart';
import 'package:movie_app/core/resouce.dart';
import 'package:movie_app/features/movies/data/remote/movie_service.dart';
import 'package:movie_app/features/movies/data/repository/movie_repository.dart';
import 'package:movie_app/features/movies/domain/movie.dart';
import 'package:movie_app/features/movies/presentation/widgets/movie_list_item.dart';

class MovieList extends StatefulWidget {
  const MovieList({super.key, required this.path});
  final String path;

  @override
  State<MovieList> createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  final PagingController<int, Movie> _pagingController =
      PagingController(firstPageKey: AppConstants.firstPageKey);

  Future<void> _fetchPage(page) async {
    Resource<List<Movie>> result =
        await MovieRepository(movieService: MovieService())
            .getMovies(widget.path, page);
    if (result is Success) {
      List<Movie> movies = result.data!;
      final bool isLastPage = movies.length < AppConstants.pageSize;

      if (isLastPage) {
        _pagingController.appendLastPage(movies);
      } else {
        _pagingController.appendPage(movies, page + 1);
      }
    } else {
      _pagingController.error = result.message!;
    }
  }

  @override
  void initState() {
    _pagingController.addPageRequestListener((page) {
      _fetchPage(page);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PagedListView<int, Movie>(
      pagingController: _pagingController,
      scrollDirection: Axis.horizontal,
      builderDelegate: PagedChildBuilderDelegate(
        itemBuilder: (context, item, index) => MovieListItem(movie: item),
      ),
    );
  }
}
