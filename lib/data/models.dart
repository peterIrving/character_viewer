class SearchResult {
  String? abstract;
  String? abstractSource;
  String? abstractText;
  String? abstractURL;
  String? answer;
  String? answerType;
  String? definition;
  String? definitionSource;
  String? definitionURL;
  String? entity;
  String? heading;
  String? image;
  int? imageHeight;
  int? imageIsLogo;
  int? imageWidth;
  String? infobox;
  String? redirect;
  List<CharacterResponse> characterResponses;

  SearchResult({
    required this.abstract,
    required this.abstractSource,
    required this.abstractText,
    required this.abstractURL,
    required this.answer,
    required this.answerType,
    required this.definition,
    required this.definitionSource,
    required this.definitionURL,
    required this.entity,
    required this.heading,
    required this.image,
    required this.imageHeight,
    required this.imageIsLogo,
    required this.imageWidth,
    required this.infobox,
    required this.redirect,
    required this.characterResponses,
  });

  factory SearchResult.fromJson(Map<String, dynamic> json) {
    return SearchResult(
      abstract: json['Abstract'],
      abstractSource: json['AbstractSource'],
      abstractText: json['AbstractText'],
      abstractURL: json['AbstractURL'],
      answer: json['Answer'],
      answerType: json['AnswerType'],
      definition: json['Definition'],
      definitionSource: json['DefinitionSource'],
      definitionURL: json['DefinitionURL'],
      entity: json['Entity'],
      heading: json['Heading'],
      image: json['Image'],
      imageHeight: json['ImageHeight'],
      imageIsLogo: json['ImageIsLogo'],
      imageWidth: json['ImageWidth'],
      infobox: json['Infobox'],
      redirect: json['Redirect'],
      characterResponses: (json['RelatedTopics'] as List<dynamic>)
          .map((i) => i == null
              ? null
              : CharacterResponse.fromJson(i as Map<String, dynamic>))
          .whereType<CharacterResponse>()
          .toList(),
    );
  }
}

class CharacterResponse {
  String? firstURL;
  Icon? icon;
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
      icon: json['Icon'] == null ? null : Icon.fromJson(json['Icon']),
      result: json['Result'],
      text: json['Text'],
    );
  }
}

class Icon {
  String? height;
  String? url;
  String? width;

  Icon({
    required this.height,
    required this.url,
    required this.width,
  });

  factory Icon.fromJson(Map<String, dynamic> json) {
    return Icon(
      height: json['Height'],
      url: json['URL'],
      width: json['Width'],
    );
  }
}
