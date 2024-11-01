import 'package:movie_app/features/movies/data/remote/movie_dto.dart';
import 'package:movie_app/features/movies/data/remote/movie_service.dart';
import 'package:movie_app/features/movies/domain/movie.dart';

class MovieRepository {
  MovieRepository({required this.movieService});
  final MovieService movieService;

  Future<List<Movie>> getMovies(String path, int page) async { 
    List<MovieDto> moviesDto = await movieService.getMovies(path, page);

    return moviesDto.map((movieDto) => movieDto.toMovie()).toList();
  }
}