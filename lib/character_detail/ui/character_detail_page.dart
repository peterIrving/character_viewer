/// only used for mobile
///

import 'package:characters_coding_test/character_detail/ui/character_detail_view.dart';
import 'package:flutter/material.dart';

class CharacterDetailPage extends StatelessWidget {
  const CharacterDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Character Detail Page")),
      body: const CharacterDetailView(),
    );
  }
}
