import 'package:movie_app/core/app_constants.dart';

enum MovieEnum {
  popular(name: "Popular", path: AppConstants.popularPath),
  nowPlaying(name: "Now playing", path: AppConstants.nowPlayingPath),
  topRated(name: "Top rated", path: AppConstants.topRatedPath),
  upcoming(name: "Upcoming", path: AppConstants.upcomingPath);

  const MovieEnum({required this.name, required this.path});
  final String name;
  final String path;
}