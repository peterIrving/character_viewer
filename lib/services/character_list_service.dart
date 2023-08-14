import 'dart:convert';

import 'package:characters_coding_test/data/character_entity.dart';
import 'package:characters_coding_test/data/models.dart';
import 'package:characters_coding_test/my_app.dart';
import 'package:http/http.dart' as http;

class CharacterListService {
  Future<List<CharacterEntity>> getCharacters(AppConfig config) async {
    final response = await http.get(config.apiURL);
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
