import 'package:characters_coding_test/data/character_entity.dart';
import 'package:equatable/equatable.dart';

class CharacterDetailState extends Equatable {
  const CharacterDetailState({
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

  @override
  List<Object?> get props => [
        characterEntity,
      ];
}
