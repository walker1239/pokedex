import 'package:pokedex/domain/model/pokemons.dart';
import 'package:pokedex/domain/usecase/get_pokemons_usecase.dart';
import 'package:rxdart/rxdart.dart';

class PokedexViewModel
    with PokedexViewModelInput, PokedexViewModelOutput {
  final GetPokemonsUseCase _getPokemonsUseCase;

  PokedexViewModel(this._getPokemonsUseCase);

  BehaviorSubject<Pokemons?> _pokemonsStreamCtrl =
  BehaviorSubject<Pokemons?>.seeded(null);

  @override
  start() {
    if (_pokemonsStreamCtrl.isClosed) {
      _pokemonsStreamCtrl =
      BehaviorSubject<Pokemons?>.seeded(null);
    }
    _fetchPokemons();
  }

  @override
  finish() {
    _pokemonsStreamCtrl.close();
  }

  @override
  Sink<Pokemons?> get pokemonsInput =>
      _pokemonsStreamCtrl.sink;

  @override
  Stream<Pokemons?> get pokemonsOutput =>
      _pokemonsStreamCtrl.stream;


  Future<void> _fetchPokemons() async {
    final result = await _getPokemonsUseCase.execute(null);
    result.fold(
          (failure) {
            pokemonsInput.add(null);
      },
          (pokemons) {
            pokemonsInput.add(pokemons);
      },
    );
  }
}

mixin PokedexViewModelInput{
  Sink<Pokemons?> get pokemonsInput;
}

mixin PokedexViewModelOutput{
  Stream<Pokemons?> get pokemonsOutput;
}
