import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/auth/presentation/blocs/login_bloc.dart';
import 'package:movie_app/features/auth/presentation/blocs/login_event.dart';
import 'package:movie_app/features/auth/presentation/blocs/login_state.dart';
import 'package:movie_app/shared/presentation/pages/home_page.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final TextEditingController _usernameController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocListener<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state is LoginSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                      'Wellcome ${state.loginDto.firstName} ${state.loginDto.lastName}'),
                ),
              );
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomePage(),
                  ));
            } else if (state is LoginError) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Wrong credentials'),
                ),
              );
            }
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _usernameController,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      border: OutlineInputBorder(),
                      label: Text('Username')),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.lock),
                      suffixIcon: IconButton(
                          onPressed: () {}, icon: const Icon(Icons.visibility)),
                      border: const OutlineInputBorder(),
                      label: const Text('Password')),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                      onPressed: () {
                        final String username = _usernameController.text;
                        final String password = _passwordController.text;
                        context.read<LoginBloc>().add(LoginSubmitted(
                            username: username, password: password));
                      },
                      child: const Text('Login')),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
