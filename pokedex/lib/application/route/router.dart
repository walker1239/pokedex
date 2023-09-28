import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex/application/route/routes.dart';
import 'package:pokedex/domain/model/pokemon_detail.dart';

extension Router on BuildContext {
  backView({Object? object}) => canPop() ? pop(object) : goInitial();

  goInitial() => goNamed(Routes.initial);

  pushDetail(String id, PokemonDetail? pokemonDetail) => pushNamed(Routes.detail,
      pathParameters: {"id": id}, extra: pokemonDetail);
}
