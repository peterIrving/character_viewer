import 'package:characters_coding_test/character_list/state/character_list_state.dart';
import 'package:characters_coding_test/data/api_status.dart';
import 'package:characters_coding_test/services/character_list_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// CharacterListCubit
class CharacterListCubit extends Cubit<CharacterListState> {
  CharacterListCubit({
    required CharacterListState initialState,
    required this.service,
  }) : super(initialState);

  final CharacterListService service;
  Future<void> load() async {
    emit(state.copyWith(status: APIStatus.loading));
    try {
      final results = await service.getCharacters(state.config);
      emit(state.copyWith(status: APIStatus.loaded, data: results));
    } catch (e) {
      emit(state.copyWith(status: APIStatus.error, errorMessage: e.toString()));
    }
  }

  void updateSearchString(String newValue) {
    emit(state.copyWith(searchString: newValue));
  }
}
