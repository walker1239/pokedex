import 'package:json_annotation/json_annotation.dart';

part 'pokemon_detail_response.g.dart';


@JsonSerializable()
class PokemonDetailResponse {
  int? height;
  int? id;
  String? name;
  int? order;
  @JsonKey(name: 'species')
  PokemonSpecies? pokemonSpecies;
  @JsonKey(name: 'sprites')
  Sprites? pokemonSprites;
  List<Stat>? stats;
  List<Type>? types;
  int? weight;
  List<Abilities>? abilities;

  PokemonDetailResponse({
    this.height,
    this.id,
    this.name,
    this.order,
    this.pokemonSpecies,
    this.pokemonSprites,
    this.stats,
    this.types,
    this.weight,
    this.abilities
  });

  factory PokemonDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$PokemonDetailResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonDetailResponseToJson(this);
}

@JsonSerializable()
class PokemonSpecies {
  String? name;
  String? url;

  PokemonSpecies({
    this.name,
    this.url,
  });

  factory PokemonSpecies.fromJson(Map<String, dynamic> json) =>
      _$PokemonSpeciesFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonSpeciesToJson(this);
}

@JsonSerializable()
class Sprites {
  @JsonKey(name: 'front_default')
  String? frontDefault;

  Sprites({
    this.frontDefault,
  });

  factory Sprites.fromJson(Map<String, dynamic> json) =>
      _$SpritesFromJson(json);

  Map<String, dynamic> toJson() => _$SpritesToJson(this);
}

@JsonSerializable()
class Stat {
  int? baseStat;
  int? effort;
  @JsonKey(name: 'stat')
  StatInfo? statInfo;

  Stat({
    this.baseStat,
    this.effort,
    this.statInfo,
  });

  factory Stat.fromJson(Map<String, dynamic> json) => _$StatFromJson(json);

  Map<String, dynamic> toJson() => _$StatToJson(this);
}

@JsonSerializable()
class StatInfo {
  String? name;
  String? url;

  StatInfo({
    this.name,
    this.url,
  });

  factory StatInfo.fromJson(Map<String, dynamic> json) =>
      _$StatInfoFromJson(json);

  Map<String, dynamic> toJson() => _$StatInfoToJson(this);
}

@JsonSerializable()
class Type {
  int? slot;
  @JsonKey(name: 'type')
  TypeInfo? typeInfo;

  Type({
    this.slot,
    this.typeInfo,
  });

  factory Type.fromJson(Map<String, dynamic> json) => _$TypeFromJson(json);

  Map<String, dynamic> toJson() => _$TypeToJson(this);
}

@JsonSerializable()
class TypeInfo {
  String? name;
  String? url;

  TypeInfo({
    this.name,
    this.url,
  });

  factory TypeInfo.fromJson(Map<String, dynamic> json) =>
      _$TypeInfoFromJson(json);

  Map<String, dynamic> toJson() => _$TypeInfoToJson(this);
}

@JsonSerializable()
class Abilities {
  Ability? ability;
  @JsonKey(name: 'is_hidden')
  bool? isHidden;
  int? slot;

  Abilities({
    this.ability,
    this.isHidden,
    this.slot
  });

  factory Abilities.fromJson(Map<String, dynamic> json) =>
      _$AbilitiesFromJson(json);

  Map<String, dynamic> toJson() => _$AbilitiesToJson(this);
}

@JsonSerializable()
class Ability {
  String? name;
  String? url;

  Ability({
    this.name,
    this.url,
  });

  factory Ability.fromJson(Map<String, dynamic> json) =>
      _$AbilityFromJson(json);

  Map<String, dynamic> toJson() => _$AbilityToJson(this);
}

