import 'package:newsly/domain/news.dart';

abstract class NewsState {}

class NewsInitialState extends NewsState {}

class NewsLoadingState extends NewsState {}

class NewsLoadedState extends NewsState {
  List<News> news;
  NewsLoadedState({required this.news});
}

class NewsErrorState extends NewsState {
  String message;
  NewsErrorState({required this.message});
}
