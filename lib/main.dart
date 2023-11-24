import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokedex',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Pokedex'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Pokemon> _pokemons = [];
  HttpClient client = HttpClient();
  final imageUrl = Uri.parse(
      'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home');

  Future<void> getPokemonList(List<Pokemon> pokemons) async {
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

      setState(() {
        _pokemons = pokemons;
      });
    } on Exception catch (e) {
      throw Exception(e);
    } finally {
      client.close();
    }
  }

  @override
  void initState() {
    getPokemonList(_pokemons);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: _pokemons.length,
          itemBuilder: (context, index) {
            if (_pokemons.isEmpty) return const Text('No data');
            return ListTile(
              leading: CircleAvatar(
                child: Image.network(
                    "$imageUrl/${_pokemons[index].pokemodId}.png",
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                  return const Text('No image');
                }, loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return const CircularProgressIndicator();
                }),
              ),
              title: Text(_pokemons[index].name ?? 'No name'),
            );
          },
        ),
      ),
    );
  }
}

final class Pokemon {
  final int? id;
  final String? name;
  final int? pokemodId;

  Pokemon({
    required this.name,
    required this.id,
    required this.pokemodId,
  });
}
