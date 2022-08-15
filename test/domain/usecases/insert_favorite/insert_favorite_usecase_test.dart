import 'package:cep/domain/contracts/repositories/favorite_repository.dart';
import 'package:cep/domain/entities/cep_entity.dart';
import 'package:cep/domain/usecases/insert_favorite/insert_favorite_usecase.dart';
import 'package:cep/domain/usecases/insert_favorite/insert_favorite_usecase_impl.dart';
import 'package:either_dart/either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../mock/cep_mock.dart';

class FavoriteRepositoryMock extends Mock implements FavoriteRepository {}

void main() {
  late FavoriteRepository repository;
  late InsertFavoriteUsecase sut;
  late Map<String, dynamic> remoteCepJson;
  late CepEntity cepEntity;
  setUp(() {
    repository = FavoriteRepositoryMock();
    sut = InsertFavoriteUsecaseImpl(repository: repository);
    remoteCepJson = CepMock.validLocalCepJson;
    cepEntity = CepMock.validCepEntity;
  });
  group('Insert favorite usecase', () {
    success() {
      when(() => repository.insert(remoteCepJson))
          .thenAnswer((invocation) async => const Right(1));
    }

    fail(Exception error) {
      when(() => repository.insert(remoteCepJson))
          .thenAnswer((invocation) async => Left(error));
    }

    test('Should be return a valid int', () async {
      success();
      final result = await sut.call(cepEntity);
      expect(result.isRight, true);
      verify(() => repository.insert(remoteCepJson)).called(1);
    });
    test('Should be return an Exception', () async {
      fail(Exception('Error'));
      final result = await sut.call(cepEntity);
      expect(result.left, isA<Exception>());
      expect(result.isLeft, true);
    });

    test('Should be return an Exception when cep is null', () async {
      final result = await sut.call(CepMock.emptyCepEntity);
      expect(result.left, isA<Exception>());
      expect(result.isLeft, true);
    });
  });
}
