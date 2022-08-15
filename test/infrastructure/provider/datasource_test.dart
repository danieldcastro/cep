import 'package:cep/domain/contracts/gateways/http_service.dart';
import 'package:cep/infrastructure/provider/datasource.dart';
import 'package:either_dart/either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../mock/cep_mock.dart';

class DatasourceMock extends Mock implements Datasource {}

void main() {
  late Datasource sut;

  setUp(() {
    sut = DatasourceMock();
  });

  group('Datasource', () {
    success() {
      when(() => sut.getCepInfoByCepNumber(CepMock.validCep)).thenAnswer(
          (_) async => Right(
              HttpResponse(data: CepMock.validResponseJson, statusCode: 200)));
    }

    test('Should be return a cep info', () async {
      success();
      final result = await sut.getCepInfoByCepNumber(CepMock.validCep);
      verify(() => sut.getCepInfoByCepNumber(CepMock.validCep)).called(1);
      expect(result.right, isA<HttpResponse>());
    });
  });
}
