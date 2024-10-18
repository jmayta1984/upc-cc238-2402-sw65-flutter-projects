import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsly/presentation/bloc/news_bloc.dart';
import 'package:newsly/presentation/bloc/news_event.dart';
import 'package:newsly/presentation/bloc/news_state.dart';
import 'package:newsly/presentation/news_detail/news_details_screen.dart';

class SearchNewsPage extends StatefulWidget {
  const SearchNewsPage({super.key});

  @override
  State<SearchNewsPage> createState() => _SearchNewsPageState();
}

class _SearchNewsPageState extends State<SearchNewsPage> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
          child: TextField(
            onSubmitted: (value) {
              context.read<NewsBloc>().add(SearchNews(query: value));
            },
            controller: _controller,
            decoration: InputDecoration(
                hintText: 'Search news',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16))),
          ),
        ),
        BlocBuilder<NewsBloc, NewsState>(
          builder: (context, state) {
            if (state is NewsLoadingState) {
              return const CircularProgressIndicator();
            } else {
              if (state is NewsLoadedState) {
                return Expanded(
                  child: ListView.builder(
                    itemCount: state.news.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => NewsDetailsScreen(
                                      news: state.news[index]),
                                ));
                          },
                          child: Card(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Hero(
                                    tag: state.news[index].title,
                                    child: Image.network(
                                      state.news[index].urlToImage,
                                      width: double.infinity,
                                      height: 150,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 8.0, right: 8.0),
                                  child: Text(
                                    state.news[index].title,
                                    maxLines: 1,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 8.0, right: 8.0),
                                  child: Text(state.news[index].author),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(state.news[index].description,
                                      maxLines: 3),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
              }
            }
            return const Text('Search news');
          },
        )
      ],
    );
  }
}
