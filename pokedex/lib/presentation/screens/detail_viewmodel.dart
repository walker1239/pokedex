import 'package:pokedex/domain/model/pokemon_detail.dart';
import 'package:pokedex/domain/model/pokemons.dart';
import 'package:pokedex/domain/usecase/get_pokemon_detail_usecase.dart';
import 'package:pokedex/domain/usecase/get_pokemons_usecase.dart';
import 'package:rxdart/rxdart.dart';

class DetailViewModel with DetailViewModelInput, DetailViewModelOutput {
  final GetPokemonDetailUseCase _getPokemonDetailUseCase;

  DetailViewModel(this._getPokemonDetailUseCase);

  BehaviorSubject<PokemonDetail?> _pokemonsStreamCtrl =
      BehaviorSubject<PokemonDetail?>.seeded(null);

  start() {
    if (_pokemonsStreamCtrl.isClosed) {
      _pokemonsStreamCtrl = BehaviorSubject<PokemonDetail?>.seeded(null);
    }
  }

  finish() {
    _pokemonsStreamCtrl.close();
  }

  @override
  Sink<PokemonDetail?> get _pokemonDetailInput => _pokemonsStreamCtrl.sink;

  @override
  Stream<PokemonDetail?> get pokemonDetailOutput => _pokemonsStreamCtrl.stream;

  Future<void> fetchPokemonDetails(String url) async {
    final result = await _getPokemonDetailUseCase.execute(url);
    result.fold(
      (failure) {
        _pokemonDetailInput.add(null);
      },
      (pokemonDetail) {
        _pokemonDetailInput.add(pokemonDetail);
      },
    );
  }

  Future<void> setPokemonDetail(PokemonDetail pokemonDetail)async {
    _pokemonDetailInput.add(pokemonDetail);
  }
}

mixin DetailViewModelInput {
  Sink<PokemonDetail?> get _pokemonDetailInput;
}

mixin DetailViewModelOutput {
  Stream<PokemonDetail?> get pokemonDetailOutput;
}
