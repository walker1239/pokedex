import 'package:pokedex/data/responses/pokemon_detail_response.dart';
import 'package:pokedex/data/responses/pokemons_response.dart';
import 'package:pokedex/data/service/network_service.dart';

abstract class NetworkDataSource {
  Future<PokemonsResponse> getPokemons();
  Future<PokemonDetailResponse> getPokemonDetail(String url);
}

class NetworkDataSourceImpl implements NetworkDataSource {
  final NetworkService _networkService;

  NetworkDataSourceImpl(this._networkService);

  @override
  Future<PokemonsResponse> getPokemons() =>
      _networkService.getPokemons();

  @override
  Future<PokemonDetailResponse> getPokemonDetail(String url) =>
      _networkService.getPokemonDetail(url);
}