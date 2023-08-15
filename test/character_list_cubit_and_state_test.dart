import 'package:bloc_test/bloc_test.dart';
import 'package:characters_coding_test/character_list/state/character_list_cubit.dart';
import 'package:characters_coding_test/character_list/state/character_list_state.dart';
import 'package:characters_coding_test/data/api_status.dart';
import 'package:characters_coding_test/data/app_config.dart';
import 'package:characters_coding_test/data/character_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'mocks.dart';

void main() {
  MockCharacterListService mockService = MockCharacterListService();
  final mockConfig = AppConfig('title', Uri());
  final initialState = CharacterListState(config: mockConfig);
  const mockCharacterList = [
    CharacterEntity(
      name: 'name1',
      description: 'description1',
      imageSrc: 'imageSrc1',
    ),
    CharacterEntity(
      name: 'name2',
      description: 'description2',
      imageSrc: 'imageSrc2',
    ),
    CharacterEntity(
      name: 'name3',
      description: 'description3',
      imageSrc: 'imageSrc3',
    ),
  ];

  blocTest<CharacterListCubit, CharacterListState>(
    'character list cubit loads successfully',
    build: () {
      when(() => mockService.getCharacters(mockConfig)).thenAnswer(
        (_) async => mockCharacterList,
      );
      return CharacterListCubit(
        initialState: initialState,
        service: mockService,
      );
    },
    act: (bloc) async {
      await bloc.load();
    },
    expect: () => <CharacterListState>[
      initialState.copyWith(status: APIStatus.loading),
      initialState.copyWith(status: APIStatus.loaded, data: mockCharacterList),
    ],
  );

  blocTest<CharacterListCubit, CharacterListState>(
    'character list cubit throws an error',
    build: () {
      when(() => mockService.getCharacters(mockConfig)).thenThrow(
        Exception('error'),
      );
      return CharacterListCubit(
        initialState: initialState,
        service: mockService,
      );
    },
    act: (bloc) async {
      await bloc.load();
    },
    expect: () => <CharacterListState>[
      initialState.copyWith(status: APIStatus.loading),
      initialState.copyWith(
        status: APIStatus.error,
        errorMessage: 'Exception: error',
      ),
    ],
  );

  blocTest<CharacterListCubit, CharacterListState>(
    'character list cubit updates search string',
    build: () {
      return CharacterListCubit(
        initialState: initialState,
        service: mockService,
      );
    },
    act: (bloc) async {
      bloc.updateSearchString('new search string');
    },
    expect: () => <CharacterListState>[
      initialState.copyWith(searchString: 'new search string'),
    ],
  );

  group('character list getter', () {
    test('returns filtered list when search string is not empty', () {
      final state = CharacterListState(
        config: mockConfig,
        data: mockCharacterList,
        searchString: 'name1',
      );
      expect(state.characters, [mockCharacterList[0]]);
    });

    test('returns full list when search string is empty', () {
      final state = CharacterListState(
        config: mockConfig,
        data: mockCharacterList,
        searchString: '',
      );
      expect(state.characters, mockCharacterList);
    });
  });

  group('title getter', () {
    test('returns title with config title', () {
      final state = CharacterListState(
        config: mockConfig,
        data: mockCharacterList,
        searchString: '',
      );
      expect(state.title, 'Characters from the title');
    });
  });
}
