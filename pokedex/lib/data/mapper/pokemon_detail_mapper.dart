import 'package:pokedex/application/constants/double_constants.dart';
import 'package:pokedex/application/constants/int_constants.dart';
import 'package:pokedex/application/utils/mapper_colors.dart';
import 'package:pokedex/application/constants/string_constants.dart';
import 'package:pokedex/data/responses/pokemon_detail_response.dart';
import 'package:pokedex/domain/model/pokemon_detail.dart';

extension PokemonDetailResponseMapper on PokemonDetailResponse? {
  PokemonDetail toDomain() {
    final types = this
            ?.types
            ?.map((type) => type.typeInfo?.name ?? StringConstants.empty)
            .toList() ??
        List.empty();
    final baseStats = this?.stats?.map((stat) {
          return BaseStats(
            baseStat: stat.baseStat ?? IntConstants.i0,
            effort: stat.effort ?? IntConstants.i0,
            name: stat.statInfo?.name ?? StringConstants.empty,
          );
        }).toList() ??
        List.empty();
    final moves = this?.abilities?.map((moves) {
          return moves.ability?.name ?? StringConstants.empty;
        }).toList() ??
        List.empty();

    return PokemonDetail(
      name: this?.name ?? StringConstants.empty,
      id: this?.id ?? IntConstants.i0,
      color: getColorByString(types[IntConstants.i0]),
      order: this?.order ?? IntConstants.i0,
      image: this?.pokemonSprites?.frontDefault ?? StringConstants.empty,
      types: types,
      height: (this?.height ?? IntConstants.i0) /
          DoubleConstants.d10, // Convert decimetres to meters
      weight: (this?.weight ?? IntConstants.i0) /
          DoubleConstants.d10, // Convert hectograms to kilograms
      moves: moves, // You can populate this with move data if available
      description: StringConstants.empty,
      baseStats: baseStats,
    );
  }
}
