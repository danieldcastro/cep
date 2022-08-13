import 'package:cep/domain/usecases/get_cep_info_by_cep_number/get_cep_info_by_cep_number_usecase_impl.dart';
import 'package:cep/infrastructure/contracts/repositories/get_cep_repository_impl.dart';
import 'package:get/get.dart';

import '../pages/search/controllers/search_controller.dart';

class SearchBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SearchController>(() => SearchController(
        logger: Get.find(),
        cepInfoByCepNumberUsecase: GetCepInfoByCepNumberUsecaseImpl(
            repository: GetCepRepositoryImpl(datasource: Get.find()))));
  }
}
