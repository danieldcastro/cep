import 'package:dio/dio.dart';
import 'package:logger/logger.dart' as dev_log;

import '../../../domain/contracts/gateways/http_service.dart';

var logger = dev_log.Logger(
  printer: dev_log.PrettyPrinter(),
);

class DioService implements HttpService {
  final _client = Dio();

  @override
  Future<DioService> getInstance() async {
    return this;
  }

  @override
  Future<HttpResponse> get({
    required String url,
  }) async {
    final response = await _client.get(
      url,
    );
    _logs(
        method: 'GET',
        url: url,
        response: response,
        statusCode: response.statusCode.toString());
    return HttpResponse(
      data: response.data,
      statusCode: response.statusCode,
    );
  }

  void _logs(
      {required String url,
      required Response<dynamic> response,
      required String method,
      required String statusCode}) {
    logger.i('############### $method ###############');
    logger.i('URL: $url');
    logger.i('StatusCode: $statusCode');
    logger.i('RESPONSE: ${response.data}');
    logger.i('######################################');
  }
}
