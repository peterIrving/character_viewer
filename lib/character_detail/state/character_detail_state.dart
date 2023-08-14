import 'package:characters_coding_test/data/character_entity.dart';
import 'package:characters_coding_test/my_app.dart';

class CharacterDetailState {
  CharacterDetailState({
    this.characterEntity,
  });

  final CharacterEntity? characterEntity;

  CharacterDetailState copyWith({
    CharacterEntity? characterEntity,
  }) {
    return CharacterDetailState(
      characterEntity: characterEntity ?? this.characterEntity,
    );
  }
}
