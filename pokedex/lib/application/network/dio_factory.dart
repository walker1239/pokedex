import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pokedex/application/constants/application_constants.dart';
import 'package:pokedex/application/constants/duration_constants.dart';
import 'package:pokedex/application/constants/url_constants.dart';

class DioFactory {
  DioFactory();

  Future<Dio> getDio() async {
    final dio = Dio();
    Map<String, String> headers = {
      ApplicationConstants.contentType: ApplicationConstants.applicationJson,
      ApplicationConstants.accept: ApplicationConstants.applicationJson,
    };

    dio.options = BaseOptions(
        baseUrl: UrlConstants.pokeApi,
        connectTimeout: DurationConstants.d6000m,
        receiveTimeout: DurationConstants.d6000m,
        headers: headers);
    if (!kReleaseMode) {
      dio.interceptors.add(LogInterceptor(
          requestHeader: true,
          requestBody: true,
          responseHeader: true,
          responseBody: true));
    }
    return dio;
  }
}
