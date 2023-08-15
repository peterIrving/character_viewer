import 'package:characters_coding_test/data/app_config.dart';
import 'package:characters_coding_test/data/character_entity.dart';
import 'package:characters_coding_test/my_app.dart';
import 'package:characters_coding_test/services/character_list_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mocktail/mocktail.dart';

import 'mocks.dart';

void main() {
  final mockClient = MockClient();
  setUpAll(() {
    registerFallbackValue(Uri());
  });

  /// create mock string of json response to create SearchResult
  const mockJsonString = '''
  {
    "RelatedTopics": [
      {
        "Text": "name - description",
        "Icon": {
          "URL": "url",
          "Height": "1",
          "Width": "1"
        },
        "FirstURL": "firstURL",
        "Result": "result"
      }
    ]
  }
  ''';

  test('fetches data successfully', () async {
    // Arrange
    when(() => mockClient.get(any()))
        .thenAnswer((_) async => Response(mockJsonString, 200));

    final service = CharacterListServiceImpl(mockClient);

    final searchResult = await service
        .getCharacters(AppConfig('title', Uri.parse('http://mock.apiURL.com')));

    // assert that the expected search result is returned
    expect(
      searchResult,
      [
        const CharacterEntity(
          name: 'name',
          description: 'description',
          imageSrc: 'https://duckduckgo.com/url',
        ),
      ],
    );
  });

  // fails
  test('throws an error if the http call completes with an error', () async {
    // Arrange
    when(() => mockClient.get(any())).thenAnswer(
      (_) async => Response('Not Found', 404),
    );

    final service = CharacterListServiceImpl(mockClient);

    // assert that an exception is thrown
    expect(
      () async => await service.getCharacters(
        AppConfig('title', Uri.parse('http://mock.apiURL.com')),
      ),
      throwsException,
    );
  });
}
