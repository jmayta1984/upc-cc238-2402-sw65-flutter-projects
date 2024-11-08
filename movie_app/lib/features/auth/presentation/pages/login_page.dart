import 'package:flutter/material.dart';
import 'package:movie_app/features/auth/data/remote/auth_service.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final TextEditingController _usernameController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            TextField(
              controller: _usernameController,
            ),
            TextField(
              controller: _passwordController,
            ),
            OutlinedButton(onPressed: () {
              AuthService().login(_usernameController.text, _passwordController.text);

            }, child: const Text('Login'))
          ],
        ),
      ),
    );
  }
}
