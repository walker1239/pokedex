import 'package:pokedex/application/constants/int_constants.dart';
import 'package:pokedex/application/constants/string_constants.dart';

class Failure {
  final int? code;
  final String? description;

  Failure(
      {this.code = IntConstants.i0, this.description = StringConstants.empty});
}
