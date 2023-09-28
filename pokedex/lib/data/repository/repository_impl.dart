import 'package:dartz/dartz.dart';
import 'package:pokedex/data/datasource/network_datasource.dart';
import 'package:pokedex/data/mapper/pokemon_detail_mapper.dart';
import 'package:pokedex/data/mapper/pokemons_mapper.dart';
import 'package:pokedex/domain/model/failure.dart';
import 'package:pokedex/domain/model/pokemon_detail.dart';
import 'package:pokedex/domain/model/pokemons.dart';
import 'package:pokedex/domain/repository/repository.dart';

class RepositoryImpl implements Repository {
  final NetworkDataSource _networkDataSource;

  RepositoryImpl(this._networkDataSource);

  @override
  Future<Either<Failure, Pokemons>> getPokemons() async {
    try {
      final pokemonsResponse = await _networkDataSource.getPokemons();
      final pokemons = pokemonsResponse.toDomain();
      final length = pokemons.results.length;
      for (int i = 0; i < length; i++) {
        final response = await _networkDataSource.getPokemonDetail(pokemons.results[i].url);
        pokemons.results[i].detail = response.toDomain();
      }
      return Right(pokemons);
    } catch (e) {
      return Left(Failure());
    }
  }

  @override
  Future<Either<Failure, PokemonDetail>> getPokemonDetail(String url) async {
    try {
      final pokemonDetail = await _networkDataSource.getPokemonDetail(url);
      return Right(pokemonDetail.toDomain());
    } catch (e) {
      return Left(Failure());
    }
  }
}
