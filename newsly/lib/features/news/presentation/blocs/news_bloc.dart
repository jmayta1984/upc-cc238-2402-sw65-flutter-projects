import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsly/features/news/data/remote/news_service.dart';
import 'package:newsly/features/news/presentation/blocs/news_event.dart';
import 'package:newsly/features/news/presentation/blocs/news_state.dart';
import 'package:newsly/shared/domain/entities/news.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  NewsBloc() : super(NewsInitialState()) {
    on<SearchNews>(
      (event, emit) async {
        emit(NewsLoadingState());
        try {
          List<News> news = await NewsService().searchNews(event.query);
          emit(NewsLoadedState(news: news));
        } catch (e) {
          emit(NewsErrorState(message: e.toString()));
        }
      },
    );
  }
}
