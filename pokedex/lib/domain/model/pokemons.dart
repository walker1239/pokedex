import 'package:pokedex/domain/model/pokemon_detail.dart';

class Pokemons {
  int count;
  String? next;
  String? previous;
  List<Pokemon> results;

  Pokemons({
    required this.count,
    this.next,
    this.previous,
    required this.results,
  });
}

class Pokemon {
  String name;
  String url;
  PokemonDetail? detail;

  Pokemon({
    required this.name,
    required this.url,
    this.detail
  });
}