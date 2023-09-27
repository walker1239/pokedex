import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex/application/application.dart';
import 'package:pokedex/application/dependency_injection/dependency_injection.dart';

void main() async {
  GoRouter.optionURLReflectsImperativeAPIs = true;
  await initApp();
  runApp(MyApp());
}
