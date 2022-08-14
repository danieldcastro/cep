import 'package:cep/domain/contracts/repositories/favorite_repository.dart';
import 'package:either_dart/either.dart';

import 'delete_favorite_by_id_usecase.dart';

class DeleteFavoriteByIdUsecaseImpl implements DeleteFavoriteByIdUsecase {
  final FavoriteRepository _repository;

  DeleteFavoriteByIdUsecaseImpl({required FavoriteRepository repository})
      : _repository = repository;

  @override
  Future<Either<Exception, void>> call(int id) async {
    if (id < 1) {
      return Left(Exception('Invalid ID'));
    }

    final result = await _repository.delete(id);

    if (result.isLeft) {
      return Left(result.left);
    }

    return const Right(null);
  }
}
