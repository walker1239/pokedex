import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex/application/network/dio_factory.dart';
import 'package:pokedex/data/datasource/network_datasource.dart';
import 'package:pokedex/data/repository/repository_impl.dart';
import 'package:pokedex/data/service/network_service.dart';
import 'package:pokedex/domain/repository/repository.dart';
import 'package:pokedex/domain/usecase/get_pokemon_detail_usecase.dart';
import 'package:pokedex/domain/usecase/get_pokemons_usecase.dart';
import 'package:pokedex/presentation/screens/pokedex/bloc/pokemons_bloc.dart';
import 'package:pokedex/presentation/screens/pokemon_detail/bloc/pokemon_detail_bloc.dart';

final getIt = GetIt.instance;

Future<void> initApp() async {
  final dio = await DioFactory().getDio();
  getIt.registerLazySingleton<GetPokemonsUseCase>(
      () => GetPokemonsUseCase(getIt<Repository>()));
  getIt.registerLazySingleton<Dio>(() => dio);
  getIt.registerLazySingleton<NetworkService>(
      () => NetworkService(getIt<Dio>()));
  getIt.registerLazySingleton<NetworkDataSource>(
      () => NetworkDataSourceImpl(getIt<NetworkService>()));
  getIt.registerLazySingleton<Repository>(
      () => RepositoryImpl(getIt<NetworkDataSource>()));
}

void initPokedex() {
  if (!GetIt.I.isRegistered<PokemonsBloc>()) {
    getIt.registerLazySingleton<PokemonsBloc>(
        () => PokemonsBloc(getIt<GetPokemonsUseCase>()));
  }
}

void initPokemonDetail() {
  if (!GetIt.I.isRegistered<PokemonDetailBloc>()) {
    getIt.registerLazySingleton<GetPokemonDetailUseCase>(
        () => GetPokemonDetailUseCase(getIt<Repository>()));
    getIt.registerLazySingleton<PokemonDetailBloc>(
        () => PokemonDetailBloc(getIt<GetPokemonDetailUseCase>()));
  }
}
