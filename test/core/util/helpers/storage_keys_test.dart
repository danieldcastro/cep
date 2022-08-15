import 'package:cep/core/util/helpers/storage_keys.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late StorageKeys sut;

  setUp(() {
    sut = StorageKeys();
  });

  group('Storage Keys', () {
    test('Should be return String of CEP SEARCHED storage key', () {
      expect(sut.cepSearched, 'cep_searched');
    });
  });
}
