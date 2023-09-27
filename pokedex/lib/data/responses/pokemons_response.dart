import 'package:json_annotation/json_annotation.dart';

part 'pokemons_response.g.dart';


@JsonSerializable()
class PokemonsResponse {
  int? count;
  String? next;
  String? previous;
  List<PokemonResponse>? results;

  PokemonsResponse({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  factory PokemonsResponse.fromJson(Map<String, dynamic> json) =>
      _$PokemonsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonsResponseToJson(this);
}

@JsonSerializable()
class PokemonResponse {
  String? name;
  String? url;

  PokemonResponse({
    this.name,
    this.url,
  });

  factory PokemonResponse.fromJson(Map<String, dynamic> json) =>
      _$PokemonResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonResponseToJson(this);
}
