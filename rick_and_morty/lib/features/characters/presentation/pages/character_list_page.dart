import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:rick_and_morty/core/constants/app_constants.dart';
import 'package:rick_and_morty/features/characters/data/remote/character_model.dart';
import 'package:rick_and_morty/features/characters/data/remote/character_service.dart';
import 'package:rick_and_morty/features/characters/presentation/pages/character_detail_page.dart';
import 'package:rick_and_morty/features/characters/presentation/widgets/character_list_item.dart';

class CharacterListPage extends StatefulWidget {
  const CharacterListPage({super.key});

  @override
  State<CharacterListPage> createState() => _CharacterListPageState();
}

class _CharacterListPageState extends State<CharacterListPage> {
  final PagingController<int, CharacterModel> _pagingController =
      PagingController(firstPageKey: 1);

  @override
  void initState() {
    _pagingController.addPageRequestListener(
      (page) {
        _fetchPage(page);
      },
    );
    super.initState();
  }

  Future<void> _fetchPage(int page) async {
    final newCharacters = await CharacterService().getCharacters(page);
    final isLastPage = newCharacters.length < AppConstants.pageSize;
    try {
      if (isLastPage) {
        _pagingController.appendLastPage(newCharacters);
      } else {
        _pagingController.appendPage(newCharacters, page + 1);
      }
    } catch (e) {
      _pagingController.error = e;
    }
  }

  @override
  Widget build(BuildContext context) {
    return PagedGridView<int, CharacterModel>(
      pagingController: _pagingController,
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      builderDelegate:
          PagedChildBuilderDelegate(itemBuilder: (context, item, index) {
        return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CharacterDetailPage(character: item),
                  ));
            },
            child: Hero(
              tag: item.id,
              child: CharacterListItem(character: item)));
      }),
    );
  }
}
