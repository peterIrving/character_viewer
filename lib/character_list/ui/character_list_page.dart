import 'package:characters_coding_test/character_detail/ui/character_detail_view.dart';
import 'package:characters_coding_test/character_list/state/character_list_cubit.dart';
import 'package:characters_coding_test/character_list/state/character_list_state.dart';
import 'package:characters_coding_test/character_list/ui/character_list_body.dart';
import 'package:characters_coding_test/layout_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CharacterListPage extends StatelessWidget {
  const CharacterListPage({super.key});

  int getTabletDetailViewRatio(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;
    return orientation == Orientation.portrait ? 2 : 4;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CharacterListCubit, CharacterListState>(
      builder: (context, state) => Scaffold(
        appBar: AppBar(
          title: Text(state.title),
        ),
        body: isMobileLayout(context)
            ? CharacterListBody(
                state: state,
              )
            : Row(
                children: [
                  Expanded(
                    child: CharacterListBody(
                      state: state,
                    ),
                  ),
                  const VerticalDivider(),
                  Expanded(
                    flex: getTabletDetailViewRatio(context),
                    child: const CharacterDetailView(),
                  )
                ],
              ),
      ),
    );
  }
}
