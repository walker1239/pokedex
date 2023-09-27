import 'package:dartz/dartz.dart';
import 'package:pokedex/domain/model/failure.dart';

abstract class BaseUseCase<In, Out> {
  Future<Either<Failure, Out>> execute(In input);
}
