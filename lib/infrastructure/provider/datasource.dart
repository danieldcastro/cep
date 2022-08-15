import 'package:either_dart/either.dart';

import '../../domain/contracts/gateways/http_service.dart';
import '../errors/failure_request.dart';

abstract class Datasource {
  Future<Either<FailureRequest, HttpResponse>> getCepInfoByCepNumber(
      String cepNumber);
}
