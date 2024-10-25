abstract class NewsEvent {}

class SearchNews extends NewsEvent {
  final String query;
  SearchNews({required this.query});
}