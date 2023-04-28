import 'package:either_dart/either.dart';

import '../../../core/util/helpers/datasource_constants.dart';
import '../../../domain/contracts/gateways/http_service.dart';
import '../../errors/failure_request.dart';
import '../../models/remote_error_model.dart';
import '../datasource.dart';

class DatasourceImpl implements Datasource {
  final HttpService _httpService;

  DatasourceImpl({required HttpService httpService})
      : _httpService = httpService;

  @override
  Future<Either<FailureRequest, HttpResponse>> getCepInfoByCepNumber(
      String cepNumber) async {
    final response = await _httpService.get(
      url:
          '${DatasourceConstants.CEP_API_URL}$cepNumber${DatasourceConstants.CEP_API_RESPONSE_TYPE}',
    );
    return _handleResponse(response);
  }

  Either<FailureRequest, HttpResponse> _handleResponse(HttpResponse response) {
    switch (response.statusCode) {
      case 200:
        return RemoteErrorModel.fromJson(response.data).error != false
            ? Left(FailureRequest.notFound('CEP not found'))
            : Right(response);
      case 201:
        return Right(response);
      case 204:
        return Right(response);
      case 400:
        return Left(FailureRequest.badRequest(response.data));
      case 404:
        return Left(FailureRequest.notFound(response.data));
      case 500:
        return Left(FailureRequest.serverError(response.data));
      case 409:
        return Left(FailureRequest.conflict(response.data));
      case 403:
        return Left(FailureRequest.forbidden(response.data));
      default:
        return Left(FailureRequest.unknownError(response.data));
    }
  }
}
