import 'package:cep/domain/contracts/gateways/my_logger.dart';
import 'package:cep/domain/entities/cep_entity.dart';
import 'package:cep/domain/usecases/delete_favorite_by_id/delete_favorite_by_id_usecase.dart';
import 'package:cep/domain/usecases/find_favorite/find_favorite_usecase.dart';
import 'package:cep/domain/usecases/get_cep_info_by_cep_number/get_cep_info_by_cep_number_usecase.dart';
import 'package:cep/domain/usecases/insert_favorite/insert_favorite_usecase.dart';
import 'package:cep/presentation/pages/search/controllers/search_controller.dart';
import 'package:either_dart/either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../mock/cep_mock.dart';

class FindFavoriteUsecaseMock extends Mock implements FindFavoriteUsecase {}

class DeleteFavoriteByIdUsecaseMock extends Mock
    implements DeleteFavoriteByIdUsecase {}

class InsertFavoriteUsecaseMock extends Mock implements InsertFavoriteUsecase {}

class GetCepInfoByCepNumberMock extends Mock
    implements GetCepInfoByCepNumberUsecase {}

class LoggerMock extends Mock implements MyLogger {}

void main() {
  late FindFavoriteUsecase findFavoriteUsecase;
  late DeleteFavoriteByIdUsecase deleteFavoriteByIdUsecase;
  late InsertFavoriteUsecase insertFavoriteUsecase;
  late MyLogger logger;
  late GetCepInfoByCepNumberUsecase getCepInfoByCepNumber;
  late SearchController sut;
  setUp(() {
    findFavoriteUsecase = FindFavoriteUsecaseMock();
    deleteFavoriteByIdUsecase = DeleteFavoriteByIdUsecaseMock();
    insertFavoriteUsecase = InsertFavoriteUsecaseMock();
    logger = LoggerMock();
    getCepInfoByCepNumber = GetCepInfoByCepNumberMock();
    sut = SearchController(
        getCepInfoByCepNumberUsecase: getCepInfoByCepNumber,
        findFavoriteUsecase: findFavoriteUsecase,
        deleteFavoriteUsecase: deleteFavoriteByIdUsecase,
        insertFavoriteUsecase: insertFavoriteUsecase,
        logger: logger);
  });
  group('HomeController', () {
    successFind() {
      when(() => findFavoriteUsecase.call())
          .thenAnswer((_) async => Right(CepMock.validCepEntityList));
    }

    failFind() {
      when(() => findFavoriteUsecase.call())
          .thenAnswer((_) async => Left(Exception()));
    }

    test('Should return a valid instance', () {
      expect(sut, isA<SearchController>());
    });

    test('Should be return valid method to find all favorite length', () async {
      successFind();
      final result = await sut.findAllFavorite();
      verify(() => findFavoriteUsecase.call()).called(1);
      expect(result, isA<List<CepEntity>>());
      expect(result, CepMock.validCepEntityList);
    });

    test('Should be return a error log when find all favorite method fail',
        () async {
      failFind();
      sut.findAllFavorite();
    });

    test('Should be return a valid method to check if cep is already favorited',
        () {
      successFind();
      sut.cepEntity = CepMock.validCepEntity;
      sut.checkIfCepIsAlreadyFavorite();
      verify(() => findFavoriteUsecase.call()).called(1);
      expect(sut.isFavoriteButtonPressed.value, false);
    });

    test('dispose', () {
      sut.dispose();
    });
  });
}
