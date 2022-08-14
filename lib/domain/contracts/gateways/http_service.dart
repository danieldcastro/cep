import 'package:cep/domain/contracts/gateways/my_logger.dart';

abstract class HttpService {
  Future<HttpService> getInstance();
  MyLogger getLogger();

  Future<HttpResponse> get({required String url});
}

class HttpResponse {
  final dynamic data;
  final int? statusCode;

  HttpResponse({required this.data, this.statusCode});
}
