import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pokedex/domain/model/pokemons.dart';
import 'package:pokedex/domain/usecase/get_pokemons_usecase.dart';

part 'pokemons_event.dart';
part 'pokemons_state.dart';

class PokemonsBloc extends Bloc<PokemonsEvent, PokemonsState> {
  final GetPokemonsUseCase _getPokemonsUseCase;
  Pokemons? pokemonsP;

  PokemonsBloc(this._getPokemonsUseCase) : super(PokemonsInitial()) {
    on<FetchPokemonsEvent>((event, emit) async {
      emit(PokemonsLoading());
      try {
        final result = await _getPokemonsUseCase.execute(null);
        result.fold(
          (failure) {
            emit(PokemonsError());
          },
          (pokemonsR) {
            pokemonsP = pokemonsR;
            emit(PokemonsLoaded(pokemonsLoaded: pokemonsR));
          },
        );
      } catch (e) {
        emit(PokemonsError());
      }
    });

    on<SearchPokemonEvent>((event, emit) async {
      emit(PokemonsLoading());
      if (pokemonsP != null) {
        if (event.query.isEmpty) {
          emit(
              PokemonsLoaded(pokemonsLoaded: pokemonsP!, pokemonsSearch: null));
        } else {
          var searchPokemons = pokemonsP!.copy();
          searchPokemons!.results = searchPokemons.results
              .where((pokemon) => pokemon.name
                  .toLowerCase()
                  .contains(event.query.toLowerCase()))
              .toList();
          emit(PokemonsLoaded(
              pokemonsLoaded: pokemonsP!, pokemonsSearch: searchPokemons));
        }
      } else {
        emit(PokemonsError());
      }
    });
  }
}
