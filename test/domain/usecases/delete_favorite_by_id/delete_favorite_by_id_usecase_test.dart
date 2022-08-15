import 'package:cep/domain/contracts/repositories/favorite_repository.dart';
import 'package:cep/domain/usecases/delete_favorite_by_id/delete_favorite_by_id_usecase.dart';
import 'package:cep/domain/usecases/delete_favorite_by_id/delete_favorite_by_id_usecase_impl.dart';
import 'package:either_dart/either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class FavoriteRepositoryMock extends Mock implements FavoriteRepository {}

void main() {
  late FavoriteRepository repository;
  late DeleteFavoriteByIdUsecase sut;

  setUp(() {
    repository = FavoriteRepositoryMock();
    sut = DeleteFavoriteByIdUsecaseImpl(repository: repository);
  });

  group('Delete favorite by id usecase', () {
    success() {
      when(() => repository.delete(1))
          .thenAnswer((invocation) async => const Right(1));
    }

    fail(Exception error) {
      when(() => repository.delete(1))
          .thenAnswer((invocation) async => Left(error));
    }

    test('Should be return a valid void', () async {
      success();
      final result = await sut.call(1);
      expect(result.isRight, true);
      verify(() => repository.delete(1)).called(1);
    });
    test('Should be return an Exception', () async {
      fail(Exception('Error'));
      final result = await sut.call(1);
      expect(result.left, isA<Exception>());
      expect(result.isLeft, true);
    });

    test('should be return an Exception when id is invalid', () async {
      final result = await sut.call(0);
      expect(result.left, isA<Exception>());
      expect(result.isLeft, true);
    });
  });
}
