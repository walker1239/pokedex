import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex/application/dependency_injection/dependency_injection.dart';
import 'package:pokedex/application/route/routes.dart';
import 'package:pokedex/presentation/screens/pokedex/pokedex_view.dart';
import 'package:pokedex/presentation/screens/pokemon_detail/detail_view.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');

final route = GoRouter(navigatorKey: _rootNavigatorKey, routes: [
  GoRoute(
      name: Routes.initial,
      path: Routes.initial,
      builder: (context, state) {
        initPokedex();
        return const PokedexView();
      },
      routes: [
        GoRoute(
            name: Routes.detail,
            path: ':id',
            builder: (context, state) {
              initPokemonDetail();
              return DetailView(
                url: state.pathParameters["url"] ?? "",
                pokemon: state.extra,
              );
            }),
      ]),
]);
