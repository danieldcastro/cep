import 'package:either_dart/either.dart';

import '../models/remote_cep_model.dart';

abstract class LocalDatasource {
  Future<Either<Exception, List<RemoteCepModel>>> find(
      {Map<String, dynamic>? parameter});
  Future<Either<Exception, int>> insert({required Map<String, dynamic> model});
  Future<Either<Exception, int>> delete({required int id});
}
