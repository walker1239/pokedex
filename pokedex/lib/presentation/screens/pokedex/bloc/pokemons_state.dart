part of 'pokemons_bloc.dart';

@immutable
sealed class PokemonsState {
  final Pokemons? pokemons;
  const PokemonsState({this.pokemons});
}

final class PokemonsInitial extends PokemonsState {}

final class PokemonsLoading extends PokemonsState {}

final class PokemonsLoaded extends PokemonsState {
  final Pokemons pokemonsLoaded;
  final Pokemons? pokemonsSearch;

  const PokemonsLoaded({required this.pokemonsLoaded, this.pokemonsSearch})
      : super(
          pokemons: pokemonsLoaded,
        );
}

final class PokemonsError extends PokemonsState {}
