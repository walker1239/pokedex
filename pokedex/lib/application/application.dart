import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/application/dependency_injection/dependency_injection.dart';
import 'package:pokedex/application/route/route.dart';
import 'package:pokedex/presentation/screens/pokedex/bloc/pokemons_bloc.dart';
import 'package:pokedex/presentation/screens/pokemon_detail/bloc/pokemon_detail_bloc.dart';

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<PokemonsBloc>()),
        BlocProvider(create: (context) => getIt<PokemonDetailBloc>())
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: "Pokedex",
        routerDelegate: route.routerDelegate,
        routeInformationParser: route.routeInformationParser,
        routeInformationProvider: route.routeInformationProvider,
      ),
    );
  }
}
