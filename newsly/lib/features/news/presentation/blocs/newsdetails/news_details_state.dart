abstract class NewsDetailsState {
  final bool isFavorite;
  NewsDetailsState({required this.isFavorite});
}

class NewsDetailsInitialState extends NewsDetailsState{
  NewsDetailsInitialState({required super.isFavorite});
}
