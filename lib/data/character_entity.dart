import 'package:characters_coding_test/data/response_models/character_response.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

@immutable
class CharacterEntity extends Equatable {
  final String name;
  final String description;
  final String? imageSrc;
  const CharacterEntity({
    required this.name,
    required this.description,
    this.imageSrc,
  });

  factory CharacterEntity.fromCharacterResponse(CharacterResponse response) {
    final splitText = response.text?.split(" - ") ?? [];
    final name = splitText.isNotEmpty ? splitText[0] : 'name not available';
    final description =
        splitText.length > 1 ? splitText[1] : 'description not available';

    final imageSrc = response.icon?.url! == null || response.icon!.url!.isEmpty
        ? null
        : 'https://duckduckgo.com/${response.icon!.url}';
    return CharacterEntity(
      name: name,
      description: description,
      imageSrc: imageSrc,
    );
  }

  @override
  List<Object?> get props => [
        name,
        description,
        imageSrc,
      ];
}
