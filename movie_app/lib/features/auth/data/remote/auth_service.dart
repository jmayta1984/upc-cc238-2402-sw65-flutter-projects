import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:movie_app/core/app_constants.dart';
import 'package:movie_app/features/auth/data/remote/login_request.dart';
import 'package:movie_app/features/auth/presentation/pages/login_dto.dart';

class AuthService {
  Future<void> login(String username, String password) async {
    ;

    http.Response response = await http.post(
        Uri.parse(AppConstants.authBaseUrl),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(
            LoginRequest(username: username, password: password).toMap()));
    if (response.statusCode == HttpStatus.ok) {
      Map<String, dynamic> json = jsonDecode(response.body);
      final loginDto = LoginDto.fromJson(json);
    }
  }
}
