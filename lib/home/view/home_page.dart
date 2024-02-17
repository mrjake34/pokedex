import 'package:flutter/material.dart';
import 'package:pokedex/home/model/model.dart';
import 'package:provider/provider.dart';
import '../model/user.dart';
import '../viewModel/view_model.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    context.read<ViewModel>().getPokemonList();
    super.initState();
  }

  final imageUrl = Uri.parse(
      'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Pokedex"),
      ),
      body: Center(
        child: Consumer<ViewModel>(
          builder: (BuildContext context, value, Widget? child) {
            if (value.pokemons.isEmpty) {
              return const CircularProgressIndicator();
            }
            // final pokemonsSelect = context.select((ViewModel viewModel) {
            //   viewModel.pokemons.removeWhere((element) {
            //     if (element.name == null) return false;
            //     return element.name!.contains('Bulbasaur');
            //   });
            //   return viewModel.pokemons;
            // });
            final pokemonRead = context.read<ViewModel>().pokemons;
            final pokemons = value.pokemons;
            return ListView.builder(
              shrinkWrap: true,
              itemCount: pokemons.length,
              itemBuilder: (context, index) {
                if (pokemons.isEmpty) return const Text('No data');
                final pokemon = pokemonRead[index];
                return ListTile(
                  leading: CircleAvatar(
                    child: Image.network("$imageUrl/${pokemon.pokemodId}.png",
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                      return const Text('No image');
                    }, loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return const CircularProgressIndicator();
                    }),
                  ),
                  title: Text(pokemon.name ?? 'No name'),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
