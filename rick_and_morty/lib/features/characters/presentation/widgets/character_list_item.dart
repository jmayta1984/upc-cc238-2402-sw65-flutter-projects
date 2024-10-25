import 'package:flutter/material.dart';
import 'package:rick_and_morty/features/characters/data/remote/character_model.dart';

class CharacterListItem extends StatelessWidget {
  const CharacterListItem({super.key, required this.character});
  final CharacterModel character;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Stack(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  character.image,
                  fit: BoxFit.cover,
                )),
            Positioned(
              bottom: 10,
              right: 10,
              left: 10,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  height: 30,
                  color: Colors.white.withOpacity(0.75),
                  child: Text(
                    character.name,
                    maxLines: 2,
                    style: const TextStyle(
                        fontSize: 10, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
