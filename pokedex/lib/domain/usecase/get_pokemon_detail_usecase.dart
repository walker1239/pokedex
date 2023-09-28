import 'package:dartz/dartz.dart';
import 'package:pokedex/domain/model/failure.dart';
import 'package:pokedex/domain/model/pokemon_detail.dart';
import 'package:pokedex/domain/model/pokemons.dart';
import 'package:pokedex/domain/repository/repository.dart';
import 'package:pokedex/domain/usecase/base_usecase.dart';

class GetPokemonDetailUseCase implements BaseUseCase<String, PokemonDetail> {
  final Repository _repository;

  GetPokemonDetailUseCase(this._repository);

  @override
  Future<Either<Failure, PokemonDetail>> execute(String input) =>
      _repository.getPokemonDetail(input);
}