import 'package:either_dart/either.dart';

import '../../../domain/contracts/gateways/sqlite_favorite.dart';
import '../../models/remote_cep_model.dart';
import '../local_datasource.dart';

class LocalDatasourceImpl implements LocalDatasource {
  final SqliteFavorite _sqLiteFavorite;

  LocalDatasourceImpl({required SqliteFavorite sqLiteFavorite})
      : _sqLiteFavorite = sqLiteFavorite;

  @override
  Future<Either<Exception, int>> delete({required int id}) async {
    final result = await _sqLiteFavorite.delete(id: id);
    if (result.response) {
      return Right(result.data);
    } else {
      return Left(Exception('Error deleting favorite'));
    }
  }

  @override
  Future<Either<Exception, List<RemoteCepModel>>> find(
      {Map<String, dynamic>? parameter}) async {
    final result = await _sqLiteFavorite.find();

    if (result.response) {
      List<Map<String, dynamic>> favorites = result.data;
      return Right(favorites
          .map((favorite) => RemoteCepModel.fromMap(favorite))
          .toList());
    } else {
      return Left(Exception('Error fetching favorites list'));
    }
  }

  @override
  Future<Either<Exception, int>> insert(
      {required Map<String, dynamic> model}) async {
    final result = await _sqLiteFavorite.insert(model: model);
    if (result.response) {
      return Right(result.data);
    } else {
      return Left(Exception('Error inserting favorite'));
    }
  }
}
