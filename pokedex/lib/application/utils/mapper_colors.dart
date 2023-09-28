import 'package:flutter/material.dart' show Color;
import 'package:pokedex/application/constants/color_constants.dart';
import 'package:pokedex/application/constants/int_constants.dart';

Color getColorByString(String types) {
  if (types.isEmpty) {
    return ColorConstants.unknown;
  }

  final typeToColor = {
    'normal': ColorConstants.normal,
    'fighting': ColorConstants.fighting,
    'flying': ColorConstants.flying,
    'poison': ColorConstants.poison,
    'ground': ColorConstants.ground,
    'rock': ColorConstants.rock,
    'bug': ColorConstants.bug,
    'ghost': ColorConstants.ghost,
    'steel': ColorConstants.steel,
    'fire': ColorConstants.fire,
    'water': ColorConstants.water,
    'grass': ColorConstants.grass,
    'electric': ColorConstants.electric,
    'psychic': ColorConstants.psychic,
    'ice': ColorConstants.ice,
    'dragon': ColorConstants.dragon,
    'dark': ColorConstants.dark,
    'fairy': ColorConstants.fairy,
    'unknown': ColorConstants.unknown,
    'shadow': ColorConstants.shadow,
  };
  return typeToColor[types] ?? ColorConstants.unknown;
}