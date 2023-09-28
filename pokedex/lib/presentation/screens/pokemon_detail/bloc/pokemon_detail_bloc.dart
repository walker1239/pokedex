import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pokedex/domain/model/pokemon_detail.dart';
import 'package:pokedex/domain/usecase/get_pokemon_detail_usecase.dart';

part 'pokemon_detail_event.dart';
part 'pokemon_detail_state.dart';

class PokemonDetailBloc extends Bloc<PokemonDetailEvent, PokemonDetailState> {
  final GetPokemonDetailUseCase _getPokemonsUseCase;

  PokemonDetailBloc(this._getPokemonsUseCase) : super(PokemonDetailInitial()) {
    on<FetchPokemonDetailEvent>((event, emit) async {
      emit(PokemonDetailLoading());
      try {
        final result = await _getPokemonsUseCase.execute(event.url);
        result.fold(
          (failure) {
            emit(PokemonDetailError());
          },
          (pokemons) {
            emit(PokemonDetailLoaded(pokemons));
          },
        );
      } catch (e) {
        emit(PokemonDetailError());
      }
    });

    on<SetPokemonDetailEvent>((event, emit) async {
      emit(PokemonDetailLoaded(event.pokemonDetail));
    });
  }
}
