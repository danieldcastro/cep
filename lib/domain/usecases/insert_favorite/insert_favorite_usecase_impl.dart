import 'package:cep/domain/contracts/repositories/favorite_repository.dart';
import 'package:cep/domain/entities/cep_entity.dart';
import 'package:cep/domain/usecases/insert_favorite/insert_favorite_usecase.dart';
import 'package:cep/infrastructure/models/remote_cep_model.dart';
import 'package:either_dart/either.dart';

class InsertFavoriteUsecaseImpl implements InsertFavoriteUsecase {
  final FavoriteRepository _repository;

  InsertFavoriteUsecaseImpl(this._repository);

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
