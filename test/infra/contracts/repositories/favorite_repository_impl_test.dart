import 'package:cep/domain/contracts/repositories/favorite_repository.dart';
import 'package:cep/infrastructure/contracts/repositories/favorite_repository_impl.dart';
import 'package:cep/infrastructure/models/remote_cep_model.dart';
import 'package:cep/infrastructure/provider/local_datasource.dart';
import 'package:either_dart/either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../mock/cep_mock.dart';

class LocalDataSourceMock extends Mock implements LocalDatasource {}

void main() {
  late FavoriteRepository sut;
  late LocalDatasource dataSource;
  setUp(() {
    dataSource = LocalDataSourceMock();
    sut = FavoriteRepositoryImpl(datasource: dataSource);
  });
  group('Favorite Repository', () {
    successFind() {
      when(() => dataSource.find())
          .thenAnswer((_) async => Right(CepMock.validRemoteCepModelList));
    }

    failFind() {
      when(() => dataSource.find()).thenAnswer((_) async {
        return Left(Exception('Failed to access datasource'));
      });
    }

    successDelete() {
      when(() => dataSource.delete(id: 1))
          .thenAnswer((_) async => const Right(1));
    }

    failDelete() {
      when(() => dataSource.delete(id: 1)).thenAnswer((_) async {
        return Left(Exception('Error deleting favorite'));
      });
    }

    successInsert() {
      when(() => dataSource.insert(model: CepMock.validLocalCepJson))
          .thenAnswer((_) async => const Right(1));
    }

    failInsert() {
      when(() => dataSource.insert(model: CepMock.validLocalCepJson))
          .thenAnswer((_) async {
        return Left(Exception('Error inserting favorite'));
      });
    }

    test('Should be return success when find', () async {
      successFind();
      final result = await sut.find();
      verify(() => dataSource.find()).called(1);
      expect(result, isA<Either<Exception, List<RemoteCepModel>>>());
      expect(result.isRight, true);
      expect(result.right, isA<List<RemoteCepModel>>());
      expect(result.right, CepMock.validRemoteCepModelList);
    });
    test('Should be return error when find', () async {
      failFind();
      final result = await sut.find();
      verify(() => dataSource.find()).called(1);
      expect(result, isA<Either<Exception, List<RemoteCepModel>>>());
      expect(result.isLeft, true);
      expect(result.left, isA<Exception>());
    });

    test('Should be return success when delete', () async {
      successDelete();
      final result = await sut.delete(1);
      verify(() => dataSource.delete(id: 1)).called(1);
      expect(result, isA<Either<Exception, int>>());
      expect(result.isRight, true);
      expect(result.right, isA<int>());
      expect(result.right, 1);
    });
    test('Should be return error when delete', () async {
      failDelete();
      final result = await sut.delete(1);
      verify(() => dataSource.delete(id: 1)).called(1);
      expect(result, isA<Either<Exception, int>>());
      expect(result.isLeft, true);
      expect(result.left, isA<Exception>());
    });

    test('Should be return success when insert', () async {
      successInsert();
      final result = await sut.insert(CepMock.validLocalCepJson);
      verify(() => dataSource.insert(model: CepMock.validLocalCepJson))
          .called(1);
      expect(result, isA<Either<Exception, int>>());
      expect(result.isRight, true);
      expect(result.right, isA<int>());
      expect(result.right, 1);
    });
    test('Should be return error when insert', () async {
      failInsert();
      final result = await sut.insert(CepMock.validLocalCepJson);
      verify(() => dataSource.insert(model: CepMock.validLocalCepJson))
          .called(1);
      expect(result, isA<Either<Exception, int>>());
      expect(result.isLeft, true);
      expect(result.left, isA<Exception>());
    });
  });
}
