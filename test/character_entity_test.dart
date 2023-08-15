import 'package:characters_coding_test/data/character_entity.dart';
import 'package:characters_coding_test/data/response_models/character_image.dart';
import 'package:characters_coding_test/data/response_models/character_response.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  // test conversion of character response to character entity

  test('character response to character entity', () {
    // create a mock character response
    final mockCharacterResponse = CharacterResponse(
      text: 'name - description',
      icon: CharacterImage(
        url: 'url',
        height: '1',
        width: '1',
      ),
      firstURL: 'firstURL',
      result: 'result',
    );

    // create a mock character entity
    const mockCharacterEntity = CharacterEntity(
      name: 'name',
      description: 'description',
      imageSrc: 'https://duckduckgo.com/url',
    );
    // expect the character response to equal the character entity
    expect(
      CharacterEntity.fromCharacterResponse(mockCharacterResponse),
      mockCharacterEntity,
    );
  });
}
