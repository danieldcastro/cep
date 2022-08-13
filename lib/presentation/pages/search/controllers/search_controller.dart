import 'package:cep/core/util/global_show_snackbar_function.dart';
import 'package:cep/domain/entities/cep_entity.dart';
import 'package:cep/domain/usecases/get_cep_info_by_cep_number/get_cep_info_by_cep_number_usecase.dart';
import 'package:cep/presentation/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../domain/contracts/gateways/my_logger.dart';

class SearchController extends GetxController {
  CepEntity _cepEntity = CepEntity.empty();
  RxBool isLoading = false.obs;

  TextEditingController searchTextFieldController = TextEditingController();

  RxBool isFavoriteButtonPressed = false.obs;
  final GetCepInfoByCepNumberUsecase _cepInfoByCepNumberUsecase;
  final MyLogger _logger;

  RxString foundAddress = ''.obs;

  SearchController(
      {required GetCepInfoByCepNumberUsecase cepInfoByCepNumberUsecase,
      required MyLogger logger})
      : _cepInfoByCepNumberUsecase = cepInfoByCepNumberUsecase,
        _logger = logger;

  void onTapFavoriteButton() {
    isFavoriteButtonPressed.value = !isFavoriteButtonPressed.value;
  }

  Future<void> getCepByCepNumber(String cepNumber) async {
    isLoading.value = true;
    _logger.info('searching cep: $cepNumber');
    String cepNumberFormatted = cepNumber.replaceAll('-', '');
    final result = await _cepInfoByCepNumberUsecase.call(cepNumberFormatted);

    if (result.isRight) {
      _cepEntity = result.right;
      formatFoundAddress();
      isLoading.value = false;
    } else {
      isLoading.value = false;
      _logger.error('Error when searching cep: ${result.left}');
      GlobalShowSnackbarFunction().show(
          'Não foi possível procurar o cep $cepNumber',
          color: AppColors().normalRedColor);
    }
  }

  void formatFoundAddress() {
    _cepEntity.complement.isNotEmpty
        ? foundAddress.value =
            '${_cepEntity.street} - ${_cepEntity.complement} - ${_cepEntity.city} ${_cepEntity.uf} - CEP ${_cepEntity.cep}'
        : foundAddress.value =
            '${_cepEntity.street} - ${_cepEntity.city} ${_cepEntity.uf} - CEP ${_cepEntity.cep}';
  }

  void submitSearch() {
    if (searchTextFieldController.text.length == 9) {
      getCepByCepNumber(searchTextFieldController.text);
    }
  }

  @override
  void dispose() {
    super.dispose();
    searchTextFieldController.dispose();
  }
}
