import 'package:characters_coding_test/data/character_entity.dart';
import 'package:characters_coding_test/data/api_status.dart';
import 'package:characters_coding_test/my_app.dart';
import 'package:equatable/equatable.dart';

class CharacterListState extends Equatable {
  const CharacterListState({
    required this.config,
    this.status = APIStatus.idle,
    this.searchString = '',
    this.errorMessage,
    List<CharacterEntity>? data,
  }) : _data = data;

  final AppConfig config;
  final APIStatus status;

  final String searchString;
  final String? errorMessage;
  final List<CharacterEntity>? _data;

  List<CharacterEntity>? get characters {
    if (_data != null) {
      if (searchString.isNotEmpty) {
        return _data!
            .where((element) =>
                element.name
                    .toLowerCase()
                    .contains(searchString.toLowerCase()) ||
                element.description
                    .toLowerCase()
                    .contains(searchString.toLowerCase()))
            .toList();
      }
      return _data;
    }
    return null;
  }

  String get title => "Characters from the ${config.title}";

  CharacterListState copyWith({
    APIStatus? status,
    String? searchString,
    String? errorMessage,
    List<CharacterEntity>? data,
  }) {
    return CharacterListState(
      config: config,
      status: status ?? this.status,
      searchString: searchString ?? this.searchString,
      errorMessage: errorMessage ?? this.errorMessage,
      data: data ?? _data,
    );
  }

  @override
  List<Object?> get props => [
        config,
        status,
        searchString,
        errorMessage,
        _data,
      ];
}
