import 'package:cep/domain/contracts/gateways/my_logger.dart';
import 'package:cep/domain/entities/cep_entity.dart';
import 'package:cep/domain/usecases/delete_favorite_by_id/delete_favorite_by_id_usecase.dart';
import 'package:cep/domain/usecases/find_favorite/find_favorite_usecase.dart';
import 'package:cep/presentation/pages/history/controllers/history_controller.dart';
import 'package:either_dart/either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../mock/cep_mock.dart';

class FindFavoriteUsecaseMock extends Mock implements FindFavoriteUsecase {}

class DeleteFavoriteByIdUsecaseMock extends Mock
    implements DeleteFavoriteByIdUsecase {}

class LoggerMock extends Mock implements MyLogger {}

void main() {
  late FindFavoriteUsecaseMock findFavoriteUsecaseMock;
  late DeleteFavoriteByIdUsecaseMock deleteFavoriteByIdUsecaseMock;
  late LoggerMock loggerMock;
  late HistoryController sut;
  setUp(() {
    findFavoriteUsecaseMock = FindFavoriteUsecaseMock();
    deleteFavoriteByIdUsecaseMock = DeleteFavoriteByIdUsecaseMock();
    loggerMock = LoggerMock();
    sut = HistoryController(
        findFavoriteUsecase: findFavoriteUsecaseMock,
        deleteFavoriteUsecase: deleteFavoriteByIdUsecaseMock,
        logger: loggerMock);
  });
  group('HomeController', () {
    successFind() {
      when(() => findFavoriteUsecaseMock.call())
          .thenAnswer((_) async => Right(CepMock.validCepEntityList));
    }

    failFind() {
      when(() => findFavoriteUsecaseMock.call())
          .thenAnswer((_) async => Left(Exception()));
    }

    successDelete() {
      when(() => deleteFavoriteByIdUsecaseMock.call(1))
          .thenAnswer((_) async => const Right(null));
    }

    failDelete() {
      when(() => deleteFavoriteByIdUsecaseMock.call(0))
          .thenAnswer((_) async => Left(Exception()));
    }

    test('Should return a valid instance', () {
      expect(sut, isA<HistoryController>());
    });

    test('Should be return valid method to find all favorite length', () async {
      successFind();
      await sut.findAllFavorite();
      verify(() => findFavoriteUsecaseMock.call()).called(1);
      expect(sut.myFavorites, isA<List<CepEntity>>());
      expect(sut.myFavorites, CepMock.validCepEntityList);
    });

    test('Should be return a error log when find all favorite method fail',
        () async {
      failFind();
      sut.findAllFavorite();
    });

    test('Should be return valid method to delete favorite by id', () async {
      successDelete();
    });

    test('Should be return a error log when delete favorite by id method fail',
        () async {
      failDelete();
      sut.deleteFavoriteById(0);
    });

    test('Should be return a method to format address string', () async {
      sut.formatAddressString(CepMock.validCepEntity);
    });
  });
}
