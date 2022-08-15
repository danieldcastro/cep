import 'package:cep/core/util/helpers/format_address_string.dart';
import 'package:cep/domain/contracts/gateways/my_logger.dart';
import 'package:cep/domain/entities/cep_entity.dart';
import 'package:cep/domain/usecases/delete_favorite_by_id/delete_favorite_by_id_usecase.dart';
import 'package:cep/domain/usecases/find_favorite/find_favorite_usecase.dart';
import 'package:get/get.dart';

class HistoryController extends GetxController {
  final FindFavoriteUsecase _findFavoriteUsecase;
  final DeleteFavoriteByIdUsecase _deleteFavoriteUsecase;
  final MyLogger _logger;

  RxList<CepEntity> myFavorites = <CepEntity>[].obs;
  RxBool isLoading = false.obs;

  HistoryController({
    required FindFavoriteUsecase findFavoriteUsecase,
    required DeleteFavoriteByIdUsecase deleteFavoriteUsecase,
    required MyLogger logger,
  })  : _findFavoriteUsecase = findFavoriteUsecase,
        _deleteFavoriteUsecase = deleteFavoriteUsecase,
        _logger = logger;

  Future<void> findAllFavorite() async {
    isLoading.value = true;
    final result = await _findFavoriteUsecase();

    if (result.isLeft) {
      isLoading.value = false;
      _logger.error(result.left.toString());
      return;
    }

    isLoading.value = false;
    myFavorites.assignAll(result.right);
    _logger.debug(result.right);
  }

  Future<void> deleteFavoriteById(int id) async {
    final result = await _deleteFavoriteUsecase(id);

    if (result.isLeft) {
      _logger.error(result.left.toString());
      return;
    }
    await findAllFavorite();
    _logger.debug('SUCCESSFULLY DELETED');
  }

  String formatAddressString(CepEntity cepEntity) =>
      FormatAddressString.formatByCepEntity(cepEntity);

  @override
  void onInit() {
    super.onInit();
    findAllFavorite();
  }
}
