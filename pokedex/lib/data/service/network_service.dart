import 'package:dio/dio.dart';
import 'package:pokedex/application/constants/int_constants.dart';
import 'package:pokedex/data/responses/pokemon_detail_response.dart';
import 'package:pokedex/data/responses/pokemons_response.dart';
import 'package:pokedex/domain/model/failure.dart';

class NetworkService {
  final Dio _dio;

  NetworkService(this._dio);

  Future<PokemonsResponse> getPokemons() async {
    final response = await _dio.get('/pokemon?limit=16');
    if (response.statusCode == IntConstants.i200) {
      return PokemonsResponse.fromJson(response.data);
    } else {
      throw Failure();
    }
  }

  Future<PokemonDetailResponse> getPokemonDetail(String url) async {
    final response = await _dio.get(url);
    if (response.statusCode == IntConstants.i200) {
      return PokemonDetailResponse.fromJson(response.data);
    } else {
      throw Failure();
    }
  }
}
