abstract class HttpService {
  Future<HttpService> getInstance();

  Future<HttpResponse> get({required String url});
}

class HttpResponse {
  final dynamic data;
  final int? statusCode;

  HttpResponse({required this.data, this.statusCode});
}
