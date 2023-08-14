import 'package:characters_coding_test/character_detail/state/character_detail_state.dart';
import 'package:characters_coding_test/data/character_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// CharacterDetailCubit
class CharacterDetailCubit extends Cubit<CharacterDetailState> {
  CharacterDetailCubit(
    CharacterDetailState initialState,
  ) : super(initialState);
  void loadCharacter(
    CharacterEntity character,
  ) async {
    emit(state.copyWith(characterEntity: character));
  }
}
