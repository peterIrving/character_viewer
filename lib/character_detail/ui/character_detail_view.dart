import 'package:characters_coding_test/character_detail/state/character_detail_cubit.dart';
import 'package:characters_coding_test/character_detail/state/character_detail_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CharacterDetailView extends StatelessWidget {
  const CharacterDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CharacterDetailCubit, CharacterDetailState>(
        builder: (context, state) {
      if (state.characterEntity != null) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: ListView(
            children: [
              const SizedBox(height: 32.0),
              state.characterEntity?.imageSrc == null
                  ? const Icon(
                      Icons.person,
                      size: 200,
                    )
                  : Image.network(
                      state.characterEntity!.imageSrc!,
                      width: 200,
                      height: 200,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return const SizedBox(
                          height: 200,
                          width: 200,
                          child: CircularProgressIndicator(),
                        );
                      },
                    ),
              const SizedBox(height: 32.0),
              Text(
                state.characterEntity!.name,
                style: Theme.of(context).textTheme.displaySmall,
              ),
              const SizedBox(height: 16.0),
              Text(state.characterEntity!.description),
            ],
          ),
        );
      }
      return const Center(child: Text("Please Select a Character"));
    });
  }
}
