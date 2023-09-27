import 'package:dartz/dartz.dart';
import 'package:pokedex/domain/model/failure.dart';
import 'package:pokedex/domain/model/pokemons.dart';
import 'package:pokedex/domain/repository/repository.dart';
import 'package:pokedex/domain/usecase/base_usecase.dart';

class GetPokemonsUseCase implements BaseUseCase<void, Pokemons> {
  final Repository _repository;

  GetPokemonsUseCase(this._repository);

  @override
  Future<Either<Failure, Pokemons>> execute(void input) =>
      _repository.getPokemons();
}
