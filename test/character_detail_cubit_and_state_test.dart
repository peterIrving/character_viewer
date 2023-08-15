// create tests testing all applicable lines of character detail cubit and state

import 'package:bloc_test/bloc_test.dart';
import 'package:characters_coding_test/character_detail/state/character_detail_cubit.dart';
import 'package:characters_coding_test/character_detail/state/character_detail_state.dart';
import 'package:characters_coding_test/data/character_entity.dart';

main() {
  const mockCharacter = CharacterEntity(
    name: 'name',
    description: 'description',
  );
  blocTest<CharacterDetailCubit, CharacterDetailState>(
    'character list cubit loads successfully',
    build: () {
      return CharacterDetailCubit(
        const CharacterDetailState(),
      );
    },
    act: (bloc) {
      bloc.loadCharacter(mockCharacter);
    },
    expect: () => <CharacterDetailState>[
      const CharacterDetailState(characterEntity: mockCharacter),
    ],
  );
}
