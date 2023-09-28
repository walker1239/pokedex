part of 'pokemon_detail_bloc.dart';

@immutable
sealed class PokemonDetailEvent {}

class FetchPokemonDetailEvent extends PokemonDetailEvent {
  final String url;
  FetchPokemonDetailEvent(this.url);
}

class SetPokemonDetailEvent extends PokemonDetailEvent {
  final PokemonDetail pokemonDetail;
  SetPokemonDetailEvent(this.pokemonDetail);
}
