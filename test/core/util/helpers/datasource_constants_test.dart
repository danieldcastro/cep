import 'package:cep/core/util/helpers/datasource_constants.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  late DatasourceConstants sut;

  setUp(() {
    sut = DatasourceConstants();
  });
  group('Datasource constants', () {
    test('Should be return String of CEP API URL', () {
      expect(sut.cepApiUrl, 'https://viacep.com.br/ws/');
    });

    test('Should be return String of CEP API RESPONSE TYPE', () {
      expect(sut.cepApiResponseType, '/json');
    });
  });
}
