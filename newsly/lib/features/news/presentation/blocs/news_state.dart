import 'package:newsly/shared/domain/entities/news.dart';

abstract class NewsState {}

class NewsInitalState extends NewsState {}

class NewsLoadingState extends NewsState {}

class NewsLoadedState extends NewsState {
  final List<News> news;
  NewsLoadedState({required this.news});
}

class NewsErrorState extends NewsState {
  final String message;

  NewsErrorState({required this.message});
}