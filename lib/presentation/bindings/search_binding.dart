import 'package:cep/domain/contracts/gateways/my_logger.dart';
import 'package:cep/domain/contracts/repositories/favorite_repository.dart';
import 'package:cep/domain/contracts/repositories/get_cep_repository.dart';
import 'package:cep/domain/usecases/delete_favorite_by_id/delete_favorite_by_id_usecase.dart';
import 'package:cep/domain/usecases/get_cep_info_by_cep_number/get_cep_info_by_cep_number_usecase.dart';
import 'package:cep/domain/usecases/get_cep_info_by_cep_number/get_cep_info_by_cep_number_usecase_impl.dart';
import 'package:cep/domain/usecases/insert_favorite/insert_favorite_usecase.dart';
import 'package:cep/domain/usecases/insert_favorite/insert_favorite_usecase_impl.dart';
import 'package:cep/infrastructure/contracts/repositories/get_cep_repository_impl.dart';
import 'package:get/get.dart';

import '../../domain/usecases/find_favorite/find_favorite_usecase.dart';
import '../pages/search/controllers/search_controller.dart';

class SearchBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<InsertFavoriteUsecase>(
      InsertFavoriteUsecaseImpl(repository: Get.find<FavoriteRepository>()),
    );

    Get.put<GetCepRepository>(GetCepRepositoryImpl(datasource: Get.find()));

    Get.put<GetCepInfoByCepNumberUsecase>(GetCepInfoByCepNumberUsecaseImpl(
        repository: Get.find<GetCepRepository>()));

    Get.lazyPut<SearchController>(
      () => SearchController(
        logger: Get.find<MyLogger>(),
        getCepInfoByCepNumberUsecase: Get.find<GetCepInfoByCepNumberUsecase>(),
        insertFavoriteUsecase: Get.find<InsertFavoriteUsecase>(),
        deleteFavoriteUsecase: Get.find<DeleteFavoriteByIdUsecase>(),
        findFavoriteUsecase: Get.find<FindFavoriteUsecase>(),
      ),
    );
  }
}
