import 'package:flutter/material.dart';
import 'package:newsly/presentation/home/favorite_news/favorite_news_page.dart';
import 'package:newsly/presentation/search_news/search_news_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = const [SearchNewsPage(), FavoriteNewsPage()];

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
        onTap: _onItemTapped,
      ),
      body: SafeArea(child: _pages[_selectedIndex]),
    );
  }
}
