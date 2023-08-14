import 'dart:developer';

import 'package:characters_coding_test/character_detail/state/character_detail_cubit.dart';
import 'package:characters_coding_test/character_detail/state/character_detail_state.dart';
import 'package:characters_coding_test/character_list/state/character_list_cubit.dart';
import 'package:characters_coding_test/character_list/state/character_list_state.dart';
import 'package:characters_coding_test/character_list/ui/character_list_page.dart';
import 'package:characters_coding_test/services/character_list_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppConfig {
  final String title;

  final Uri apiURL;

  AppConfig(this.title, this.apiURL);
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
    required this.config,
  });

  final AppConfig config;

  @override
  Widget build(BuildContext context) {
    final service = CharacterListService();

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => CharacterListCubit(
            service: service,
            initialState: CharacterListState(config: config),
          )..load(),
        ),
        BlocProvider(
          create: (_) => CharacterDetailCubit(
            CharacterDetailState(),
          ),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: CharacterListPage(),
      ),
    );
  }
}
