import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';

import '../model/model.dart';

final class ViewModel extends ChangeNotifier {
  List<Pokemon> _pokemons = [];
  HttpClient client = HttpClient();

  Future<void> getPokemonList() async {
    List<Pokemon> pokemons = [];
    final url = Uri.parse(
        'https://my-json-server.typicode.com/ozcanzaferayan/pokedex/pokemons');
    try {
      final request = await client.getUrl(url);
      request.headers.add('Content-Type', 'application/json');
      final response = await request.close();
      final responseBody = await response.transform(utf8.decoder).join();
      final json = jsonDecode(responseBody);
      for (var element in json) {
        pokemons.add(Pokemon(
          id: element['id'],
          name: element['name'],
          pokemodId: element['pokemonId'],
        ));
      }

      _pokemons = pokemons;
      notifyListeners();
    } on Exception catch (e) {
      throw Exception(e);
    } finally {
      client.close();
    }
  }

  List<Pokemon> get pokemons => _pokemons;
}
