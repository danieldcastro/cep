import 'package:cep/domain/contracts/gateways/my_logger.dart';
import 'package:cep/domain/usecases/find_favorite/find_favorite_usecase.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../core/util/helpers/storage_keys.dart';
import '../../../routes/routes.dart';

class HomeController extends GetxController {
  final FindFavoriteUsecase _findFavoriteUsecase;
  final MyLogger _logger;

  RxInt searchCounter = 0.obs;

  RxInt savedCounter = 0.obs;

  GetStorage get storageBox => _getStorageBox;

  final GetStorage _getStorageBox = GetStorage();

  HomeController({
    required FindFavoriteUsecase findFavoriteUsecase,
    required MyLogger logger,
  })  : _findFavoriteUsecase = findFavoriteUsecase,
        _logger = logger;

  goToHistoryPage() {
    Get.offNamed(Routes.HISTORY);
  }

  Future<void> findAllFavorite() async {
    final result = await _findFavoriteUsecase();

    if (result.isLeft) {
      _logger.error(result.left.toString());
      return;
    }

    savedCounter.value = result.right.length;
    _logger.debug(result.right);
  }

  void getSearchCounter() {
    if (_getStorageBox.read(StorageKeys.CEP_SEARCHED) != null) {
      searchCounter.value = _getStorageBox.read(StorageKeys.CEP_SEARCHED);
    }
  }

  @override
  void onInit() {
    super.onInit();
    getSearchCounter();
    findAllFavorite();
  }
}
