import 'package:rick_and_morty/features/characters/domain/character.dart';

class CharacterModel extends Character {
  CharacterModel(
      {required super.id,
      required super.name,
      required super.status,
      required super.species,
      required super.image});

  factory CharacterModel.fromJson(Map<String, dynamic> json) {
    return CharacterModel(
        id: json['id'] ?? 0,
        name: json['name'] ?? '',
        status: json['status'] ?? '',
        species: json['species'],
        image: json['image']);
  }
}
