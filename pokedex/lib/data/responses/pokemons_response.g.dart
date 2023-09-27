// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemons_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokemonsResponse _$PokemonsResponseFromJson(Map<String, dynamic> json) =>
    PokemonsResponse(
      count: json['count'] as int?,
      next: json['next'] as String?,
      previous: json['previous'] as String?,
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => PokemonResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PokemonsResponseToJson(PokemonsResponse instance) =>
    <String, dynamic>{
      'count': instance.count,
      'next': instance.next,
      'previous': instance.previous,
      'results': instance.results,
    };

PokemonResponse _$PokemonResponseFromJson(Map<String, dynamic> json) =>
    PokemonResponse(
      name: json['name'] as String?,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$PokemonResponseToJson(PokemonResponse instance) =>
    <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
    };
