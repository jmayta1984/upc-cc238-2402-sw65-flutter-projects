abstract class  CharacterEvent {}

class GetCharacters extends CharacterEvent {
  final int page;
  GetCharacters({required this.page});
}