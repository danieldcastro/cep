import 'package:cep/core/util/helpers/storage_keys.dart';
import 'package:cep/domain/contracts/gateways/my_logger.dart';
import 'package:cep/domain/usecases/find_favorite/find_favorite_usecase.dart';
import 'package:cep/presentation/pages/home/controllers/home_controller.dart';
import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../mock/cep_mock.dart';

class FindFavoriteUsecaseMock extends Mock implements FindFavoriteUsecase {}

class LoggerMock extends Mock implements MyLogger {}

void main() {
  late HomeController sut;
  late FindFavoriteUsecaseMock findFavoriteUsecaseMock;
  late LoggerMock loggerMock;

  setUp(() {
    findFavoriteUsecaseMock = FindFavoriteUsecaseMock();
    loggerMock = LoggerMock();
    sut = HomeController(
        findFavoriteUsecase: findFavoriteUsecaseMock, logger: loggerMock);
  });

  group('HomeController', () {
    success() {
      when(() => findFavoriteUsecaseMock.call())
          .thenAnswer((_) async => Right(CepMock.validCepEntityList));
    }

    fail() {
      when(() => findFavoriteUsecaseMock.call())
          .thenAnswer((_) async => Left(Exception()));
    }

    test('Should return a valid instance', () {
      expect(sut, isA<HomeController>());
    });

    test('Should be return valid method to all favorite length', () async {
      success();
      await sut.findAllFavorite();
      verify(() => findFavoriteUsecaseMock.call()).called(1);
      expect(sut.savedCounter.value, isA<int>());
      expect(sut.savedCounter.value, CepMock.validCepEntityList.length);
    });

    test('Should be return a error log when find all favorite method fail',
        () async {
      fail();
      sut.findAllFavorite();
    });

    test('Should be go to History page', () async {
      WidgetsFlutterBinding.ensureInitialized();
      Get.testMode = true;

      sut.goToHistoryPage();
    });

    test('Should be return a valid method to get search counter', () {
      int searchCounter = sut.storageBox.read(StorageKeys.CEP_SEARCHED) ?? 0;
      sut.getSearchCounter();
      expect(sut.searchCounter.value, isA<int>());
      expect(sut.searchCounter.value, searchCounter);
    });
  });
}
