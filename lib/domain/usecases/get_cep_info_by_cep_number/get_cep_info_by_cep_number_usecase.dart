import 'package:either_dart/either.dart';

import '../../entities/cep_entity.dart';

abstract class GetCepInfoByCepNumberUsecase {
  Future<Either<Exception, CepEntity>> call(String cepNumber);
}
