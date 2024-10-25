import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/features/characters/presentation/blocs/character_bloc.dart';
import 'package:rick_and_morty/shared/presentation/pages/home_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CharacterBloc>(
      create: (context) => CharacterBloc(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: HomePage(),
        ),
      ),
    );
  }
}
