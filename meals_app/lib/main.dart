import 'package:flutter/material.dart';
import 'package:meals_app/shared/home_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomePage(),
      darkTheme: ThemeData.dark(),
      theme: ThemeData.light(),
    );
  }
}
