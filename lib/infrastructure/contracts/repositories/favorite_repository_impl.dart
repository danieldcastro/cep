import 'package:either_dart/either.dart';

import '../../../domain/contracts/repositories/favorite_repository.dart';
import '../../models/remote_cep_model.dart';
import '../../provider/local_datasource.dart';

class FavoriteRepositoryImpl implements FavoriteRepository {
  final LocalDatasource _datasource;

  FavoriteRepositoryImpl({required LocalDatasource datasource})
      : _datasource = datasource;

  @override
  Future<Either<Exception, int>> delete(int id) async {
    final result = await _datasource.delete(id: id);
    try {
      return Right(result.right);
    } on Exception {
      return Left(Exception('Failed to access datasource'));
    }
  }

  @override
  Future<Either<Exception, List<RemoteCepModel>>> find() async {
    final result = await _datasource.find();
    try {
      return Right(result.right);
    } on Exception {
      return Left(Exception('Failed to access datasource'));
    }
  }

  @override
  Future<Either<Exception, int>> insert(Map<String, dynamic> model) async {
    final result = await _datasource.insert(model: model);

    try {
      return Right(result.right);
    } on Exception {
      return Left(Exception('Failed to access datasource'));
    }
  }
}
