import 'package:cep/domain/entities/cep_entity.dart';
import 'package:either_dart/either.dart';

import '../../../domain/contracts/repositories/get_cep_repository.dart';
import '../../errors/failure_request.dart';
import '../../models/remote_cep_model.dart';
import '../../models/remote_error_model.dart';
import '../../provider/datasource.dart';

class GetCepRepositoryImpl implements GetCepRepository {
  final Datasource _datasource;

  GetCepRepositoryImpl({required Datasource datasource})
      : _datasource = datasource;

  @override
  Future<Either<FailureRequest, CepEntity>> call(String cepNumber) async {
    final result = await _datasource.getCepInfoByCepNumber(cepNumber);
    if (result.isLeft) {
      return Left(result.left);
    } else if (result.right.data.toString().contains('erro') &&
        RemoteErrorModel.fromJson(result.right.data).error == 'true') {
      return const Left(FailureRequest(message: 'CEP not found'));
    } else {
      final cep = RemoteCepModel.fromJson(result.right.data);

      final cepModelToEntity = CepEntity.fromModel(cep);

      return Right(cepModelToEntity);
    }
  }
}
