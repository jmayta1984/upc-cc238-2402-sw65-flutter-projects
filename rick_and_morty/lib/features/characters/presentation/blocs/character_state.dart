import 'package:rick_and_morty/features/characters/domain/character.dart';

abstract class CharacterState {}

class CharacterInitialState extends CharacterState {}

class CharacterLoadingState extends CharacterState {}

class CharacterLoadedState extends CharacterState {
  final List<Character> characters;
  CharacterLoadedState({required this.characters});
}

class CharacterErrorState extends CharacterState {
  final String message;
  CharacterErrorState({required this.message});
}
