import 'package:cep/domain/contracts/repositories/get_cep_repository.dart';
import 'package:cep/domain/entities/cep_entity.dart';
import 'package:either_dart/either.dart';

import 'get_cep_info_by_cep_number_usecase.dart';

class GetCepInfoByCepNumberUsecaseImpl implements GetCepInfoByCepNumberUsecase {
  final GetCepRepository _repository;

  GetCepInfoByCepNumberUsecaseImpl({required GetCepRepository repository})
      : _repository = repository;

  @override
  Future<Either<Exception, CepEntity>> call(String cepNumber) async {
    if (cepNumber.trim().isEmpty) {
      return Left(Exception('O CEP não pode estar vazio'));
    }
    final response = await _repository.call(cepNumber);

    if (response.isLeft) {
      return Left(response.left);
    } else {
      return Right(response.right);
    }
  }
}
