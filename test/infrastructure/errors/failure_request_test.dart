import 'package:cep/infrastructure/errors/failure_request.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Failure request', () {
    test('Should be return a valid bad request error', () {
      final error = FailureRequest.badRequest();

      expect(error, isA<FailureRequest>());
      expect(error, FailureRequest.badRequest());
    });

    test('Should be return a valid not found error', () {
      final error = FailureRequest.notFound();

      expect(error, isA<FailureRequest>());
      expect(error, FailureRequest.notFound());
    });

    test('Should be return a valid server error', () {
      final error = FailureRequest.serverError();

      expect(error, isA<FailureRequest>());
      expect(error, FailureRequest.serverError());
    });

    test('Should be return a valid forbidden error', () {
      final error = FailureRequest.forbidden();

      expect(error, isA<FailureRequest>());
      expect(error, FailureRequest.forbidden());
    });

    test('Should be return a valid conflict error', () {
      final error = FailureRequest.conflict();

      expect(error, isA<FailureRequest>());
      expect(error, FailureRequest.conflict());
    });

    test('Should be return a valid unknown error', () {
      final error = FailureRequest.unknownError();

      expect(error, isA<FailureRequest>());
      expect(error, FailureRequest.unknownError());
    });

    test('Should be hashCode', () {
      final errorHashcode = FailureRequest.badRequest().hashCode;

      expect(errorHashcode, isA<int>());
    });

    test('Should be toString', () {
      final errorToString = FailureRequest.badRequest().toString();

      expect(errorToString, isA<String>());
    });

    test('Should be return props', () {
      final errorProps = FailureRequest.badRequest().props;

      expect(errorProps, isA<List<Object?>>());
    });
  });
}
