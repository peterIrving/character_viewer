import 'package:characters_coding_test/data/response_models/character_image.dart';

class CharacterResponse {
  String? firstURL;
  CharacterImage? icon;
  String? result;
  String? text;

  CharacterResponse({
    required this.firstURL,
    required this.icon,
    required this.result,
    required this.text,
  });

  factory CharacterResponse.fromJson(Map<String, dynamic> json) {
    return CharacterResponse(
      firstURL: json['FirstURL'],
      icon: json['Icon'] == null ? null : CharacterImage.fromJson(json['Icon']),
      result: json['Result'],
      text: json['Text'],
    );
  }
}
