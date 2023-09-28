part of 'pokemon_detail_bloc.dart';

@immutable
sealed class PokemonDetailState {}

final class PokemonDetailInitial extends PokemonDetailState {}

final class PokemonDetailLoading extends PokemonDetailState {}

final class PokemonDetailLoaded extends PokemonDetailState {
  final PokemonDetail pokemons;
  PokemonDetailLoaded(this.pokemons);
}

final class PokemonDetailError extends PokemonDetailState {}
