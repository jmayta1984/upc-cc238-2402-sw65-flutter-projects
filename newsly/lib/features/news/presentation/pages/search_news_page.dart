import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsly/features/news/presentation/blocs/news_bloc.dart';
import 'package:newsly/features/news/presentation/blocs/news_event.dart';
import 'package:newsly/features/news/presentation/blocs/news_state.dart';
import 'package:newsly/features/news/presentation/pages/news_details_page.dart';
import 'package:newsly/features/news/presentation/widgets/news_image.dart';

class SearchNewsPage extends StatefulWidget {
  const SearchNewsPage({super.key});

  @override
  State<SearchNewsPage> createState() => _SearchNewsPageState();
}

class _SearchNewsPageState extends State<SearchNewsPage> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
      return [
        SliverAppBar(
          floating: true,
          snap: true,
          flexibleSpace: FlexibleSpaceBar(
            background: Padding(
              padding: const EdgeInsets.all(4),
              child: TextField(
                onSubmitted: (value) {
                  context.read<NewsBloc>().add(SearchNews(query: value));
                },
                controller: _controller,
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)))),
              ),
            ),
          ),
        )
      ];
    }, body: BlocBuilder<NewsBloc, NewsState>(
      builder: (context, state) {
        if (state is NewsLoadingState) {
          return const Center(
                      child: CircularProgressIndicator(),
                    );
        } else if (state is NewsLoadedState) {
          return ListView.builder(
            itemCount: state.news.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(4.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              NewsDetailsPage(news: state.news[index]),
                        ));
                  },
                  child: Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Hero(
                          tag: state.news[index].title,
                          child: NewsImage(
                            url: state.news[index].urlToImage,
                            width: double.infinity,
                            height: 150,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            state.news[index].title,
                            maxLines: 1,
                            style:
                                const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              bottom: 4, left: 4, right: 4),
                          child: Text(state.news[index].author),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            state.news[index].description,
                            maxLines: 3,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        } else if (state is NewsErrorState) {
          return Center(
            child: Text(state.message),
          );
        } else {
          return const Center();
        }
      },
    ));
  }
}
