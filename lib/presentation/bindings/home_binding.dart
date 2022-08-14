import 'package:cep/domain/contracts/gateways/my_logger.dart';
import 'package:cep/domain/usecases/find_favorite/find_favorite_usecase.dart';
import 'package:get/get.dart';

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
