import 'package:cep/domain/contracts/repositories/favorite_repository.dart';
import 'package:cep/domain/entities/cep_entity.dart';
import 'package:cep/domain/usecases/find_favorite/find_favorite_usecase.dart';
import 'package:cep/domain/usecases/find_favorite/find_favorite_usecase_impl.dart';
import 'package:cep/infrastructure/models/remote_cep_model.dart';
import 'package:either_dart/either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../mock/cep_mock.dart';

class FavoriteRepositoryMock extends Mock implements FavoriteRepository {}

void main() {
  late FavoriteRepository repository;
  late FindFavoriteUsecase sut;
  late List<RemoteCepModel> remoteCep;
  late List<CepEntity> cepEntity;

  setUp(() {
    repository = FavoriteRepositoryMock();
    sut = FindFavoriteUsecaseImpl(repository: repository);
    remoteCep = CepMock.validRemoteCepModelList;
    cepEntity = remoteCep.map((entity) => CepEntity.fromModel(entity)).toList();
  });
  group('Find favorite usecase', () {
    success() {
      when(() => repository.find())
          .thenAnswer((invocation) async => Right(remoteCep));
    }

    fail(Exception error) {
      when(() => repository.find())
          .thenAnswer((invocation) async => Left(error));
    }

    test('Should be return a valid List of CepEntity', () async {
      success();
      final result = await sut.call();
      expect(result.right, isA<List<CepEntity>>());
      expect(result.right, cepEntity);
      expect(result.isRight, true);
      verify(() => repository.find()).called(1);
    });
    test('Should be return an Exception', () async {
      fail(Exception('Error'));
      final result = await sut.call();
      expect(result.left, isA<Exception>());
      expect(result.isLeft, true);
    });
  });
}
