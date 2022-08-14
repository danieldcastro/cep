import 'package:cep/core/util/global_show_snackbar_function.dart';
import 'package:cep/core/util/helpers/format_address_string.dart';
import 'package:cep/core/util/helpers/storage_keys.dart';
import 'package:cep/domain/entities/cep_entity.dart';
import 'package:cep/domain/usecases/delete_favorite_by_id/delete_favorite_by_id_usecase.dart';
import 'package:cep/domain/usecases/get_cep_info_by_cep_number/get_cep_info_by_cep_number_usecase.dart';
import 'package:cep/domain/usecases/insert_favorite/insert_favorite_usecase.dart';
import 'package:cep/presentation/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../domain/contracts/gateways/my_logger.dart';
import '../../../../domain/usecases/find_favorite/find_favorite_usecase.dart';

class SearchController extends GetxController {
  CepEntity _cepEntity = CepEntity.empty();
  RxBool isLoading = false.obs;
  RxString foundAddress = ''.obs;
  RxBool isFavoriteButtonPressed = false.obs;
  TextEditingController searchTextFieldController = TextEditingController();

  final GetStorage _getStorageBox = GetStorage();

  final GetCepInfoByCepNumberUsecase _cepInfoByCepNumberUsecase;
  final MyLogger _logger;
  final InsertFavoriteUsecase _insertFavoriteUsecase;
  final FindFavoriteUsecase _findFavoriteUsecase;
  final DeleteFavoriteByIdUsecase _deleteFavoriteUsecase;

  SearchController(
      {required GetCepInfoByCepNumberUsecase cepInfoByCepNumberUsecase,
      required InsertFavoriteUsecase insertFavoriteUsecase,
      required FindFavoriteUsecase findFavoriteUsecase,
      required DeleteFavoriteByIdUsecase deleteFavoriteUsecase,
      required MyLogger logger})
      : _cepInfoByCepNumberUsecase = cepInfoByCepNumberUsecase,
        _insertFavoriteUsecase = insertFavoriteUsecase,
        _deleteFavoriteUsecase = deleteFavoriteUsecase,
        _findFavoriteUsecase = findFavoriteUsecase,
        _logger = logger;

  void onTapFavoriteButton() async {
    isFavoriteButtonPressed.value = !isFavoriteButtonPressed.value;

    if (isFavoriteButtonPressed.value) {
      await _insertFavorite();
    } else {
      await _deleteFavoriteById();
    }
  }

  Future<void> _getCepByCepNumber(String cepNumber) async {
    isLoading.value = true;
    _logger.info('searching cep: $cepNumber');
    String cepNumberFormatted = cepNumber.replaceAll('-', '');
    final result = await _cepInfoByCepNumberUsecase.call(cepNumberFormatted);

    if (result.isRight) {
      _cepEntity = result.right;
      isFavoriteButtonPressed.value = false;
      foundAddress.value = FormatAddressString.formatByCepEntity(_cepEntity);
      await _saveCepSearchCount();
      _checkIfCepIsAlreadyFavorited();
      isLoading.value = false;
    } else {
      isLoading.value = false;
      _logger.error('Error when searching cep: ${result.left}');
      GlobalShowSnackbarFunction().show(
          'Não conseguimos localizar seu endereço, verifique se as informações passadas estão corretas',
          color: AppColors().normalRedColor);
    }
  }

  Future<void> _saveCepSearchCount() async {
    _getStorageBox.writeIfNull(StorageKeys.CEP_SEARCHED, 0);
    int searchCounter = 0;

    if (_getStorageBox.read(StorageKeys.CEP_SEARCHED) != null) {
      searchCounter = _getStorageBox.read(StorageKeys.CEP_SEARCHED);
    }

    searchCounter++;

    _getStorageBox.write(StorageKeys.CEP_SEARCHED, searchCounter);

    _logger.info('cep searched: $searchCounter');
  }

  void submitSearch() {
    if (searchTextFieldController.text.length == 9) {
      _getCepByCepNumber(searchTextFieldController.text);
    }
  }

  Future<void> _insertFavorite() async {
    final result = await _insertFavoriteUsecase(_cepEntity);

    if (result.isLeft) {
      _logger.error(result.left.toString());
      return;
    }

    _cepEntity.id = result.right;
    _logger.info(_cepEntity);
    _logger.debug('SUCCESSFULLY ADDED');
  }

  Future<void> _deleteFavoriteById() async {
    final CepEntity entity = _cepEntity;
    _logger.info(entity);

    final result = await _deleteFavoriteUsecase(entity.id);

    if (result.isLeft) {
      _logger.error(result.left.toString());
      return;
    }

    _logger.debug('SUCCESSFULLY DELETED');
  }

  Future<List<CepEntity>> _findAllFavorite() async {
    final result = await _findFavoriteUsecase();

    if (result.isLeft) {
      _logger.error(result.left.toString());
      return [];
    }
    _logger.debug(result.right);
    return result.right;
  }

  _checkIfCepIsAlreadyFavorited() {
    _findAllFavorite().then((list) {
      for (var cep in list) {
        if (cep.cep == _cepEntity.cep) {
          isFavoriteButtonPressed.value = true;
          _cepEntity.id = cep.id;
        }
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    searchTextFieldController.dispose();
  }
}
