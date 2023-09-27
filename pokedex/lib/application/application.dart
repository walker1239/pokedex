import 'package:flutter/material.dart';
import 'package:pokedex/application/route/route.dart';

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      //title: ApplicationConstants.titleApp,
      //theme: AppThemes().appTheme,
      routerDelegate: route.routerDelegate,
      routeInformationParser: route.routeInformationParser,
      routeInformationProvider: route.routeInformationProvider,
    );
  }
}
