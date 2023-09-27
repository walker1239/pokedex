import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex/application/route/routes.dart';


extension Router on BuildContext {
  backView({Object? object}) => canPop() ? pop(object) : goInitial();

  goInitial() => goNamed(Routes.initial);
}