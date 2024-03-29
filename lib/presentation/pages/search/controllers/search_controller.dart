import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../core/util/global_show_snackbar_function.dart';
import '../../../../core/util/helpers/format_address_string.dart';
import '../../../../core/util/helpers/storage_keys.dart';
import '../../../../domain/contracts/gateways/my_logger.dart';
import '../../../../domain/entities/cep_entity.dart';
import '../../../../domain/usecases/delete_favorite_by_id/delete_favorite_by_id_usecase.dart';
import '../../../../domain/usecases/find_favorite/find_favorite_usecase.dart';
import '../../../../domain/usecases/get_cep_info_by_cep_number/get_cep_info_by_cep_number_usecase.dart';
import '../../../../domain/usecases/insert_favorite/insert_favorite_usecase.dart';
import '../../../theme/app_colors.dart';

class SearchController extends GetxController {
  CepEntity _cepEntity = CepEntity.empty();
  RxBool isLoading = false.obs;
  RxString foundAddress = ''.obs;
  RxBool isFavoriteButtonPressed = false.obs;
  TextEditingController searchTextFieldController = TextEditingController();

  set cepEntity(CepEntity value) {
    value = _cepEntity;
  }

  final GetStorage _getStorageBox = GetStorage();

  final GetCepInfoByCepNumberUsecase _getCepInfoByCepNumberUsecase;
  final MyLogger _logger;
  final InsertFavoriteUsecase _insertFavoriteUsecase;
  final FindFavoriteUsecase _findFavoriteUsecase;
  final DeleteFavoriteByIdUsecase _deleteFavoriteUsecase;

  SearchController(
      {required GetCepInfoByCepNumberUsecase getCepInfoByCepNumberUsecase,
      required InsertFavoriteUsecase insertFavoriteUsecase,
      required FindFavoriteUsecase findFavoriteUsecase,
      required DeleteFavoriteByIdUsecase deleteFavoriteUsecase,
      required MyLogger logger})
      : _getCepInfoByCepNumberUsecase = getCepInfoByCepNumberUsecase,
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

  Future<void> getCepInfoByCepNumber(String cepNumber) async {
    isLoading.value = true;
    _logger.info('searching cep: $cepNumber');
    String cepNumberFormatted = cepNumber.replaceAll('-', '');
    final result = await _getCepInfoByCepNumberUsecase.call(cepNumberFormatted);

    if (result.isRight) {
      _cepEntity = result.right;
      isFavoriteButtonPressed.value = false;
      foundAddress.value = FormatAddressString.formatByCepEntity(_cepEntity);
      await _saveCepSearchCount();
      checkIfCepIsAlreadyFavorite();
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
      getCepInfoByCepNumber(searchTextFieldController.text);
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

  Future<List<CepEntity>> findAllFavorite() async {
    final result = await _findFavoriteUsecase();

    if (result.isLeft) {
      _logger.error(result.left.toString());
      return [];
    }
    _logger.debug(result.right);
    return result.right;
  }

  checkIfCepIsAlreadyFavorite() {
    findAllFavorite().then((list) {
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
