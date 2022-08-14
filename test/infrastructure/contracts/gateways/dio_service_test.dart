import 'package:cep/domain/contracts/gateways/http_service.dart';
import 'package:cep/infrastructure/contracts/gateways/dio_service.dart';
import 'package:cep/infrastructure/contracts/gateways/logger_impl.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late HttpService sut;
  setUp(() {
    sut = DioService();
  });
  group('DioService', () {
    test('should return statuscode 200', () async {
      final result = await sut.get(
        url: 'https://google.com',
      );
      expect(result, isA<HttpResponse>());
      expect(result.statusCode, 200);
    });

    test('Should be return instance of DioService', () async {
      final result = await sut.getInstance();
      expect(result, isA<DioService>());
    });
  });

  test('Should be return a logger implementation', () {
    final result = sut.getLogger();
    expect(result, isA<LoggerImpl>());
  });
}
