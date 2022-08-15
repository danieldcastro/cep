import 'package:cep/infrastructure/models/remote_cep_model.dart';
import 'package:cep/infrastructure/provider/local_datasource.dart';
import 'package:either_dart/either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../mock/cep_mock.dart';

class LocalDatasourceMock extends Mock implements LocalDatasource {}

void main() {
  late LocalDatasource sut;

  setUp(() {
    sut = LocalDatasourceMock();
  });

  group('LocalDatasource', () {
    successFind() {
      when(() => sut.find())
          .thenAnswer((_) async => Right(CepMock.validRemoteCepModelList));
    }

    failFind(Exception error) {
      when(() => sut.find()).thenAnswer((_) async => Left(error));
    }

    successDelete() {
      when(() => sut.delete(id: 1)).thenAnswer((_) async => const Right(0));
    }

    failDelete(Exception error) {
      when(() => sut.delete(id: 0)).thenAnswer((_) async => Left(error));
    }

    successInsert() {
      when(() => sut.insert(model: CepMock.validLocalCepJson))
          .thenAnswer((_) async => const Right(0));
    }

    failInsert(Exception error) {
      when(() => sut.insert(model: CepMock.validLocalCepJson))
          .thenAnswer((_) async => Left(error));
    }

    test('Should be return a valid method to find all', () async {
      successFind();
      final result = await sut.find();
      verify(() => sut.find()).called(1);
      expect(result.isRight, true);
      expect(result.right, isA<List<RemoteCepModel>>());
      expect(result.right, CepMock.validRemoteCepModelList);
    });

    test('Should be return a exception when find all method fail', () async {
      failFind(Exception());
      final result = await sut.find();
      verify(() => sut.find()).called(1);
      expect(result.isLeft, true);
      expect(result.left, isA<Exception>());
    });

    test('Should be return a valid method to delete', () async {
      successDelete();
      final result = await sut.delete(id: 1);
      verify(() => sut.delete(id: 1)).called(1);
      expect(result.isRight, true);
      expect(result.right, isA<int>());
      expect(result.right, 0);
    });

    test('Should be return a exception when delete method fail', () async {
      failDelete(Exception());
      final result = await sut.delete(id: 0);
      verify(() => sut.delete(id: 0)).called(1);
      expect(result.isLeft, true);
      expect(result.left, isA<Exception>());
    });

    test('Should be return a valid method to insert', () async {
      successInsert();
      final result = await sut.insert(model: CepMock.validLocalCepJson);
      verify(() => sut.insert(model: CepMock.validLocalCepJson)).called(1);
      expect(result.isRight, true);
      expect(result.right, isA<int>());
      expect(result.right, 0);
    });

    test('Should be return a exception when insert method fail', () async {
      failInsert(Exception());
      final result = await sut.insert(model: CepMock.validLocalCepJson);
      verify(() => sut.insert(model: CepMock.validLocalCepJson)).called(1);
      expect(result.isLeft, true);
      expect(result.left, isA<Exception>());
    });
  });
}
