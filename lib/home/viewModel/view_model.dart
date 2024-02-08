import 'dart:convert';

import 'package:flutter/material.dart';

import '../model/model.dart';
import '../service/service.dart';

final class ViewModel extends ChangeNotifier {
  List<Pokemon> _pokemons = [];

  Future<void> getPokemonList() async {
    List<Pokemon> pokemons = [];
    final response = await Service.fetchService();
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
  }

  List<Pokemon> get pokemons => _pokemons;
}
