import 'package:cep/domain/entities/cep_entity.dart';
import 'package:either_dart/either.dart';

abstract class InsertFavoriteUsecase {
  Future<Either<Exception, int>> call(CepEntity entity);
}
