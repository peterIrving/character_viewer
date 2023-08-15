import 'package:characters_coding_test/services/character_list_service.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mocktail/mocktail.dart';
import 'package:http/http.dart';

class MockCharacterListService extends Mock implements CharacterListService {}

class MockClient extends Mock implements Client {}

class MockDotEnv extends Mock implements DotEnv {}
