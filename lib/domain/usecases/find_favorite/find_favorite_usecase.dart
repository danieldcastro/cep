import 'package:cep/domain/entities/cep_entity.dart';
import 'package:either_dart/either.dart';

abstract class FindFavoriteUsecase {
  Future<Either<Exception, List<CepEntity>>> call();
}
