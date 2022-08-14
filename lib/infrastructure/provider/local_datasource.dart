import 'package:cep/infrastructure/models/remote_cep_model.dart';
import 'package:either_dart/either.dart';

abstract class LocalDatasource {
  Future<Either<Exception, List<RemoteCepModel>>> find(
      {Map<String, dynamic>? parameter});
  Future<Either<Exception, int>> insert({required Map<String, dynamic> model});
  Future<Either<Exception, int>> delete({required int id});
}
