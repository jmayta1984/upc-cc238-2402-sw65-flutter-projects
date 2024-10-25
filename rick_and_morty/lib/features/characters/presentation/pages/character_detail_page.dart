import 'package:flutter/material.dart';
import 'package:rick_and_morty/features/characters/data/remote/character_model.dart';
import 'package:rick_and_morty/features/favorites/data/local/favorite_dao.dart';
import 'package:rick_and_morty/features/favorites/data/local/favorite_model.dart';

class CharacterDetailPage extends StatefulWidget {
  const CharacterDetailPage({super.key, required this.character});
  final CharacterModel character;

  @override
  State<CharacterDetailPage> createState() => _CharacterDetailPageState();
}

class _CharacterDetailPageState extends State<CharacterDetailPage> {
  bool _isFavorite = false;

  Future<void> _validate() async {
    bool favorite = await FavoriteDao().isFavorite(widget.character.id);
    setState(() {
      _isFavorite = favorite;
    });
  }

  @override
  void initState() {
    _validate();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                expandedHeight: height * 0.35,
                floating: false,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  background: Hero(
                    tag: widget.character.id,
                    child: Image.network(widget.character.image,
                        width: double.infinity,
                        height: height * 0.35,
                        fit: BoxFit.cover),
                  ),
                ),
              )
            ];
          },
          body: Column(
            children: [
              Text(widget.character.name),
              Text(widget.character.status),
              Text(widget.character.species),
              IconButton.outlined(
                  onPressed: () {
                    setState(() {
                      _isFavorite = !_isFavorite;
                    });
                    if (_isFavorite) {
                      FavoriteDao().insertFavorite(FavoriteModel(
                        id: widget.character.id,
                        name: widget.character.name,
                        status: widget.character.status,
                        species: widget.character.species,
                        image: widget.character.image,
                      ));
                    } else {
                      FavoriteDao().deleteFavorite(widget.character.id);
                    }
                  },
                  icon: Icon(
                    Icons.favorite,
                    color: _isFavorite ? Colors.red : Colors.grey,
                  ))
            ],
          )),
    );
  }
}
