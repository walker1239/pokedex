// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_detail_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokemonDetailResponse _$PokemonDetailResponseFromJson(
        Map<String, dynamic> json) =>
    PokemonDetailResponse(
      height: json['height'] as int?,
      id: json['id'] as int?,
      name: json['name'] as String?,
      order: json['order'] as int?,
      pokemonSpecies: json['species'] == null
          ? null
          : PokemonSpecies.fromJson(json['species'] as Map<String, dynamic>),
      pokemonSprites: json['sprites'] == null
          ? null
          : Sprites.fromJson(json['sprites'] as Map<String, dynamic>),
      stats: (json['stats'] as List<dynamic>?)
          ?.map((e) => Stat.fromJson(e as Map<String, dynamic>))
          .toList(),
      types: (json['types'] as List<dynamic>?)
          ?.map((e) => Type.fromJson(e as Map<String, dynamic>))
          .toList(),
      weight: json['weight'] as int?,
      abilities: (json['abilities'] as List<dynamic>?)
          ?.map((e) => Abilities.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PokemonDetailResponseToJson(
        PokemonDetailResponse instance) =>
    <String, dynamic>{
      'height': instance.height,
      'id': instance.id,
      'name': instance.name,
      'order': instance.order,
      'species': instance.pokemonSpecies,
      'sprites': instance.pokemonSprites,
      'stats': instance.stats,
      'types': instance.types,
      'weight': instance.weight,
      'abilities': instance.abilities,
    };

PokemonSpecies _$PokemonSpeciesFromJson(Map<String, dynamic> json) =>
    PokemonSpecies(
      name: json['name'] as String?,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$PokemonSpeciesToJson(PokemonSpecies instance) =>
    <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
    };

Sprites _$SpritesFromJson(Map<String, dynamic> json) => Sprites(
      frontDefault: json['front_default'] as String?,
    );

Map<String, dynamic> _$SpritesToJson(Sprites instance) => <String, dynamic>{
      'front_default': instance.frontDefault,
    };

Stat _$StatFromJson(Map<String, dynamic> json) => Stat(
      baseStat: json['baseStat'] as int?,
      effort: json['effort'] as int?,
      statInfo: json['stat'] == null
          ? null
          : StatInfo.fromJson(json['stat'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$StatToJson(Stat instance) => <String, dynamic>{
      'baseStat': instance.baseStat,
      'effort': instance.effort,
      'stat': instance.statInfo,
    };

StatInfo _$StatInfoFromJson(Map<String, dynamic> json) => StatInfo(
      name: json['name'] as String?,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$StatInfoToJson(StatInfo instance) => <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
    };

Type _$TypeFromJson(Map<String, dynamic> json) => Type(
      slot: json['slot'] as int?,
      typeInfo: json['type'] == null
          ? null
          : TypeInfo.fromJson(json['type'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TypeToJson(Type instance) => <String, dynamic>{
      'slot': instance.slot,
      'type': instance.typeInfo,
    };

TypeInfo _$TypeInfoFromJson(Map<String, dynamic> json) => TypeInfo(
      name: json['name'] as String?,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$TypeInfoToJson(TypeInfo instance) => <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
    };

Abilities _$AbilitiesFromJson(Map<String, dynamic> json) => Abilities(
      ability: json['ability'] == null
          ? null
          : Ability.fromJson(json['ability'] as Map<String, dynamic>),
      isHidden: json['is_hidden'] as bool?,
      slot: json['slot'] as int?,
    );

Map<String, dynamic> _$AbilitiesToJson(Abilities instance) => <String, dynamic>{
      'ability': instance.ability,
      'is_hidden': instance.isHidden,
      'slot': instance.slot,
    };

Ability _$AbilityFromJson(Map<String, dynamic> json) => Ability(
      name: json['name'] as String?,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$AbilityToJson(Ability instance) => <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
    };
