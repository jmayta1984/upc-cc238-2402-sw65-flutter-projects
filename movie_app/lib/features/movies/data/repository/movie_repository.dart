import 'package:movie_app/core/resouce.dart';
import 'package:movie_app/features/movies/data/remote/movie_dto.dart';
import 'package:movie_app/features/movies/data/remote/movie_service.dart';
import 'package:movie_app/features/movies/domain/movie.dart';

class MovieRepository {
  MovieRepository({required this.movieService});
  final MovieService movieService;

  Future<Resource<List<Movie>>> getMovies(String path, int page) async {
    final Resource<List<MovieDto>> result =
        await movieService.getMovies(path, page);
    if (result is Success) {
      List<MovieDto> moviesDto = result.data!;

      return Success(moviesDto.map((movieDto) => movieDto.toMovie()).toList());
    }

    return Error(result.message!);
  }
}
