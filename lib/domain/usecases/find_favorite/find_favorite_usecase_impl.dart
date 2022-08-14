import 'package:cep/domain/contracts/repositories/favorite_repository.dart';
import 'package:cep/domain/entities/cep_entity.dart';
import 'package:either_dart/either.dart';

import 'find_favorite_usecase.dart';

class FindFavoriteUsecaseImpl implements FindFavoriteUsecase {
  final FavoriteRepository _repository;

  FindFavoriteUsecaseImpl({required FavoriteRepository repository})
      : _repository = repository;

  @override
  Future<Either<Exception, List<CepEntity>>> call() async {
    final result = await _repository.find();

    if (result.isLeft) {
      return Left(result.left);
    }

    final data = result.right;
    return Right(data.map((entity) => CepEntity.fromModel(entity)).toList());
  }
}
