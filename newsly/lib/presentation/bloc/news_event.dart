abstract class NewsEvent {}

class SearchNews extends NewsEvent {
  String query;
  SearchNews({required this.query});
}
