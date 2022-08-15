import 'package:either_dart/either.dart';

import '../../../infrastructure/models/remote_cep_model.dart';
import '../../contracts/repositories/favorite_repository.dart';
import '../../entities/cep_entity.dart';
import 'insert_favorite_usecase.dart';

class InsertFavoriteUsecaseImpl implements InsertFavoriteUsecase {
  final FavoriteRepository _repository;

  InsertFavoriteUsecaseImpl({required FavoriteRepository repository})
      : _repository = repository;

  @override
  Future<Either<Exception, int>> call(CepEntity entity) async {
    if (entity.cep.isEmpty) {
      return Left(Exception('CEP is null'));
    }

    final result = await _repository.insert(RemoteCepModel.toJson(entity));

    if (result.isLeft) {
      return Left(result.left);
    }

    return Right(result.right);
  }
}
