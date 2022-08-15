import 'package:get/get.dart';

import '../../domain/contracts/gateways/my_logger.dart';
import '../../domain/usecases/find_favorite/find_favorite_usecase.dart';
import '../pages/home/controllers/home_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(
        findFavoriteUsecase: Get.find<FindFavoriteUsecase>(),
        logger: Get.find<MyLogger>(),
      ),
    );
  }
}
