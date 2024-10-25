import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/features/characters/data/remote/character_service.dart';
import 'package:rick_and_morty/features/characters/presentation/blocs/character_event.dart';
import 'package:rick_and_morty/features/characters/presentation/blocs/character_state.dart';

class CharacterBloc extends Bloc<CharacterEvent, CharacterState> {
  CharacterBloc() : super(CharacterInitialState()) {
    on<GetCharacters>((event, emit) async {
      emit(CharacterLoadingState());

      final characters = await CharacterService().getCharacters(event.page);
      emit(CharacterLoadedState(characters: characters));
    });
  }
}
