import 'package:dartz/dartz.dart';
import 'package:pokedex/data/datasource/network_datasource.dart';
import 'package:pokedex/data/mapper/pokemons_mapper.dart';
import 'package:pokedex/domain/model/failure.dart';
import 'package:pokedex/domain/model/pokemons.dart';
import 'package:pokedex/domain/repository/repository.dart';

class RepositoryImpl implements Repository {
  final NetworkDataSource _networkDataSource;

  RepositoryImpl(this._networkDataSource);

  @override
  Future<Either<Failure, Pokemons>> getPokemons() async {
    try {
      final pokemons = await _networkDataSource.getPokemons();
      return Right(pokemons.toDomain());
    } catch (e) {
      return Left(Failure());
    }
  }
}