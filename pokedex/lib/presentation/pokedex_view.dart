import 'package:flutter/material.dart';
import 'package:pokedex/application/constants/int_constants.dart';
import 'package:pokedex/application/constants/string_constants.dart';
import 'package:pokedex/application/constants/url_constants.dart';
import 'package:pokedex/application/dependency_injection/dependency_injection.dart';
import 'package:pokedex/domain/model/pokemons.dart';
import 'package:pokedex/presentation/pokedex_viewmodel.dart';

class PokedexView extends StatefulWidget {
  const PokedexView({Key? key}) : super(key: key);

  @override
  State<PokedexView> createState() => _PokedexViewState();
}

class _PokedexViewState extends State<PokedexView> {
  final _pokedexViewModel = getIt<PokedexViewModel>();

  @override
  void initState() {
    _pokedexViewModel.start();
    super.initState();
  }

  @override
  void dispose() {
    _pokedexViewModel.finish();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<Pokemons?>(
          stream: _pokedexViewModel.pokemonsOutput,
          builder: (context, snapshot) {
            final data = snapshot.data;
            return data != null
                ? ListView.builder(
                    itemCount: data.results.length,
                    itemBuilder: (context, i) {
                      final pokemon = data.results[i];
                      return Row(
                        children: [
                          Image.network(
                              "${UrlConstants.pokemonImageUrl}${pokemon.url[pokemon.url.length - IntConstants.i2]}${StringConstants.png}"),
                          Text(pokemon.name)
                        ],
                      );
                    })
                : const CircularProgressIndicator();
          }),
    );
  }
}
