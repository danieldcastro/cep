import 'package:either_dart/either.dart';

import '../../../infrastructure/models/remote_cep_model.dart';

abstract class FavoriteRepository {
  Future<Either<Exception, int>> insert(Map<String, dynamic> model);

  Future<Either<Exception, List<RemoteCepModel>>> find();

  Future<Either<Exception, int>> delete(int id);
}
