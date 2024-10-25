import 'package:flutter/material.dart';
import 'package:newsly/features/favorites/presentation/pages/favorite_news_page.dart';
import 'package:newsly/features/news/presentation/pages/search_news_page.dart';

class HomePage extends StatefulWidget {

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = const [SearchNewsPage(), FavoriteNewsPage()];

  void _onTapPressed(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
         bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'Favorites'),
        ],
        currentIndex: _selectedIndex,
        onTap: _onTapPressed,
      ),
      body: SafeArea(child: _pages[_selectedIndex]),
    );
  }
}
