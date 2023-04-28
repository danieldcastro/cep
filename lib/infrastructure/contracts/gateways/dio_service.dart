import 'package:dio/dio.dart';

import '../../../domain/contracts/gateways/http_service.dart';
import '../../../domain/contracts/gateways/my_logger.dart';
import 'logger_impl.dart';

final _logger = LoggerImpl();

class DioService implements HttpService {
  final _client = Dio();

  @override
  Future<DioService> getInstance() async {
    return this;
  }

  @override
  MyLogger getLogger() {
    return _logger;
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
    _logger.append('############### $method ###############');
    _logger.append('URL: $url');
    _logger.append('StatusCode: $statusCode');
    _logger.append('RESPONSE: ${response.data}');
    _logger.append('######################################');
    _logger.closeAppend();
  }
}
