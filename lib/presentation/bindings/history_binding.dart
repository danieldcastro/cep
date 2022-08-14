import 'package:cep/domain/contracts/gateways/my_logger.dart';
import 'package:cep/domain/usecases/find_favorite/find_favorite_usecase.dart';
import 'package:get/get.dart';

import '../../domain/usecases/delete_favorite_by_id/delete_favorite_by_id_usecase.dart';
import '../pages/history/controllers/history_controller.dart';

class HistoryBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HistoryController>(
      () => HistoryController(
        findFavoriteUsecase: Get.find<FindFavoriteUsecase>(),
        logger: Get.find<MyLogger>(),
        deleteFavoriteUsecase: Get.find<DeleteFavoriteByIdUsecase>(),
      ),
    );
  }
}
