import 'package:cep/core/util/global_validation_map_function.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Global validation map function', () {
    test('Should be return true when map is valid', () {
      final sut = GlobalValidationMapFunction.checkMap(
          keys: ['test'], map: {'test': 'test'}, className: 'TestClass');

      expect(sut, true);
    });

    test('Should be return false when a map key is not found', () {
      final sut = GlobalValidationMapFunction.checkMap(
          keys: ['test'], map: {'': 'test'}, className: 'TestClass');

      expect(sut, false);
    });

    test('Should be return false when a map key has a null value', () {
      final sut = GlobalValidationMapFunction.checkMap(
          keys: ['test'], map: {'test': null}, className: 'TestClass');

      expect(sut, false);
    });

    test('Should be return a message when a map key has a empty value', () {
      GlobalValidationMapFunction.checkMap(
          keys: ['test'], map: {'test': ''}, className: 'TestClass');
    });
  });
}
