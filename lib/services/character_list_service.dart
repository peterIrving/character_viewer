import 'dart:convert';

import 'package:characters_coding_test/data/app_config.dart';
import 'package:characters_coding_test/data/character_entity.dart';
import 'package:characters_coding_test/data/response_models/search_result.dart';
import 'package:http/http.dart';

abstract class CharacterListService {
  CharacterListService(this.client);
  final Client client;

  Future<List<CharacterEntity>> getCharacters(AppConfig config);
}

class CharacterListServiceImpl implements CharacterListService {
  CharacterListServiceImpl(this.client);

  @override
  final Client client;

  @override
  Future<List<CharacterEntity>> getCharacters(AppConfig config) async {
    final response = await client.get(config.apiURL);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);

      final searchResult = SearchResult.fromJson(json);
      final characterList =
          searchResult.characterResponses.map<CharacterEntity>((e) {
        return CharacterEntity.fromCharacterResponse(e);
      }).toList();
      return characterList;
    } else {
      throw Exception('Error fetching characters');
    }
  }
}
