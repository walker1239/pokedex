part of 'pokemons_bloc.dart';

@immutable
sealed class PokemonsEvent {}

class FetchPokemonsEvent extends PokemonsEvent {}

class SearchPokemonEvent extends PokemonsEvent {
  final String query;
  SearchPokemonEvent(this.query);
}
