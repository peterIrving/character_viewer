class CharacterImage {
  String? height;
  String? url;
  String? width;

  CharacterImage({
    required this.height,
    required this.url,
    required this.width,
  });

  factory CharacterImage.fromJson(Map<String, dynamic> json) {
    return CharacterImage(
      height: json['Height'],
      url: json['URL'],
      width: json['Width'],
    );
  }
}
