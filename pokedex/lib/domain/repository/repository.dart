import 'package:dartz/dartz.dart';
import 'package:pokedex/domain/model/failure.dart';
import 'package:pokedex/domain/model/pokemon_detail.dart';
import 'package:pokedex/domain/model/pokemons.dart';

abstract class Repository {
  Future<Either<Failure, Pokemons>> getPokemons();
  Future<Either<Failure, PokemonDetail>> getPokemonDetail(String url);
}
