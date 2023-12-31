import 'package:characters_coding_test/character_list/state/character_list_state.dart';
import 'package:characters_coding_test/character_list/ui/character_list_body_loaded.dart';
import 'package:characters_coding_test/data/api_status.dart';
import 'package:flutter/material.dart';

class CharacterListBody extends StatelessWidget {
  const CharacterListBody({
    super.key,
    required this.state,
  });
  final CharacterListState state;

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        final widget = switch (state.status) {
          APIStatus.idle ||
          APIStatus.loading =>
            const Center(child: CircularProgressIndicator()),
          APIStatus.loaded => CharacterListBodyLoaded(state: state),
          APIStatus.error => Center(
              child: Text(state.errorMessage ?? "Something went wrong"),
            ),
        };
        return widget;
      },
    );
  }
}
