import 'package:flutter/material.dart' show Color;

class PokemonDetail {
  String name;
  int id;
  Color color;
  int order;
  String image;
  List<String> types;
  double height;
  double weight;
  List<String> moves;
  String description;
  List<BaseStats> baseStats;

  PokemonDetail({
    required this.name,
    required this.id,
    required this.color,
    required this.order,
    required this.image,
    required this.types,
    required this.height,
    required this.weight,
    required this.moves,
    required this.description,
    required this.baseStats,
  });
}

class BaseStats {
  int baseStat;
  int effort;
  String name;

  BaseStats({
    required this.baseStat,
    required this.effort,
    required this.name,
  });
}
