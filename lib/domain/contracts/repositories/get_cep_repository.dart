import 'package:either_dart/either.dart';

import '../../../infrastructure/errors/failure_request.dart';
import '../../entities/cep_entity.dart';

abstract class GetCepRepository {
  Future<Either<FailureRequest, CepEntity>> call(String cepNumber);
}
