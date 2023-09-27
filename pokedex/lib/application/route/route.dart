import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex/application/dependency_injection/dependency_injection.dart';
import 'package:pokedex/application/route/routes.dart';
import 'package:pokedex/presentation/pokedex_view.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');

final route = GoRouter(navigatorKey: _rootNavigatorKey, routes: [
  GoRoute(
      name: Routes.initial,
      path: Routes.initial,
      builder: (context, state) {
        initPokedex();
        return const PokedexView();
      }),
]);
