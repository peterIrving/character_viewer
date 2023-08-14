import 'package:characters_coding_test/character_detail/state/character_detail_cubit.dart';
import 'package:characters_coding_test/character_detail/ui/character_detail_page.dart';
import 'package:characters_coding_test/character_list/state/character_list_cubit.dart';
import 'package:characters_coding_test/character_list/state/character_list_state.dart';
import 'package:characters_coding_test/layout_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CharacterListBodyLoaded extends StatelessWidget {
  const CharacterListBodyLoaded({
    super.key,
    required this.state,
  });

  final CharacterListState state;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: TextFormField(
          controller: TextEditingController(
            text: state.searchString,
          )..selection = TextSelection.fromPosition(
              TextPosition(offset: state.searchString.length),
            ),
          decoration: InputDecoration(
            hintText: 'Search for a character',
            suffixIcon: state.searchString.isNotEmpty
                ? IconButton(
                    icon: const Icon(Icons.clear),
                    onPressed: () {
                      context.read<CharacterListCubit>().updateSearchString('');
                    },
                  )
                : null,
          ),
          onChanged: (value) {
            context.read<CharacterListCubit>().updateSearchString(value);
          },
        ),
      ),
      Expanded(
        child: ListView.builder(
          itemCount: state.characters?.length ?? 0,
          itemBuilder: (context, index) {
            final character = state.characters![index];
            return ListTile(
              title: Text(character.name),
              onTap: () {
                context.read<CharacterDetailCubit>().loadCharacter(character);
                if (isMobileLayout(context)) {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const CharacterDetailPage(),
                    ),
                  );
                }
              },
            );
          },
        ),
      ),
    ]);
  }
}
