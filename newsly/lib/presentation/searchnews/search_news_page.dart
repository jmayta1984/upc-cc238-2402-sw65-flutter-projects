import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsly/presentation/bloc/news_bloc.dart';
import 'package:newsly/presentation/bloc/news_event.dart';
import 'package:newsly/presentation/bloc/news_state.dart';
import 'package:newsly/presentation/newsdetails/news_details_screen.dart';

class SearchNewsPage extends StatefulWidget {
  const SearchNewsPage({super.key});

  @override
  State<SearchNewsPage> createState() => _SearchNewsPageState();
}

class _SearchNewsPageState extends State<SearchNewsPage> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: TextField(
            onSubmitted: (value) {
              context.read<NewsBloc>().add(SearchNewsEvent(query: value));
            },
            controller: _controller,
            decoration: const InputDecoration(
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)))),
          ),
        ),
        BlocBuilder<NewsBloc, NewsState>(
          builder: (context, state) {
            if (state is NewsLoadingState) {
              return const Expanded(
                  child: Center(
                child: CircularProgressIndicator(),
              ));
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
                                    child: 
                                    Image.network(
                                      
                                      state.news[index].urlToImage,
                                      width: double.infinity,
                                      height: 150,
                                      fit: BoxFit.cover,
                                      errorBuilder:
                                          (context, error, stackTrace) {
                                        return const SizedBox(
                                            width: double.infinity,
                                            height: 150,
                                            child: Center(
                                                child: Text('No image found')));
                                      },
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Text(
                                    state.news[index].title,
                                    maxLines: 1,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 4, right: 4, bottom: 4),
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
                  ),
                );
              } else {
                if (state is NewsErrorState) {
                  return Expanded(
                      child: Center(
                    child: Text(state.message),
                  ));
                }
              }
            }
            return const Expanded(child: Center());
          },
        ),
      ],
    );
  }
}
