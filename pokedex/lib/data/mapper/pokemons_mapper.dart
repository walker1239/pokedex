import 'package:pokedex/application/constants/int_constants.dart';
import 'package:pokedex/application/constants/string_constants.dart';
import 'package:pokedex/data/responses/pokemons_response.dart';
import 'package:pokedex/domain/model/pokemon_detail.dart';
import 'package:pokedex/domain/model/pokemons.dart';

extension PokemonsResponseMapper on PokemonsResponse? {
  Pokemons toDomain() {
    final listResult = this?.results ?? List.empty();
    return Pokemons(
        count: this?.count ?? IntConstants.i0,
        results: listResult.map((e) => e.toDomain()).toList(),
        next: this?.next,
        previous: this?.previous);
  }
}

extension PokemonResponseMapper on PokemonResponse? {
  Pokemon toDomain() {
    return Pokemon(
        name: this?.name ?? StringConstants.empty,
        url: this?.url ?? StringConstants.empty,
        );
  }
}
