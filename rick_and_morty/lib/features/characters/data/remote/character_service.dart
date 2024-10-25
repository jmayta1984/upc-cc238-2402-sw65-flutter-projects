import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:rick_and_morty/core/constants/app_constants.dart';
import 'package:rick_and_morty/features/characters/data/remote/character_model.dart';

class CharacterService {
  Future<List<CharacterModel>> getCharacters(int page) async {
    final Uri url =
        Uri.parse('${AppConstants.baseUrl}${AppConstants.characterEndpoint}?page=$page');

    http.Response response = await http.get(url);

    if (response.statusCode == HttpStatus.ok) {
      Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      List maps = jsonResponse['results'];
      return maps.map((json) => CharacterModel.fromJson(json)).toList();
    }
    return [];
  }
}
