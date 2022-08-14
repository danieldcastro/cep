import 'package:cep/domain/contracts/gateways/my_logger.dart';
import 'package:cep/infrastructure/contracts/gateways/logger_impl.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late MyLogger sut;
  setUp(() {
    sut = LoggerImpl();
  });
  group('LoggerImpl', () {
    test('Should be return instance of LoggerImpl', () async {
      final result = await sut.getInstance();
      expect(result, isA<LoggerImpl>());
    });

    test('Should be return a debug log', () {
      sut.debug('debug');
    });

    test('Should be return a Warning log', () {
      sut.warning('warning');
    });

    test('Should be return a Error log', () {
      sut.error('error');
    });

    test('Should be return a Info log', () {
      sut.info('info');
    });

    test('Should be return a Append log', () {
      sut.append('append');
      sut.closeAppend();
    });
  });
}
