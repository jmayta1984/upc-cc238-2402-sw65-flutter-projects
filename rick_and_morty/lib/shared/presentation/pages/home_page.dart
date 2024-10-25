import 'package:flutter/material.dart';
import 'package:rick_and_morty/features/characters/presentation/pages/character_list_page.dart';
import 'package:rick_and_morty/features/favorites/presentation/favorite_list_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Widget> _pages = const [CharacterListPage(), FavoriteListPage()];
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Characters"),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: "Favorites"),
        ],
        onTap: (value) {
          setState(() {
            _index = value;
          });
        },
        currentIndex: _index,
      ),
      body: SafeArea(child: _pages[_index]),
    );
  }
}
