import 'package:cep/infrastructure/contracts/gateways/dio_service.dart';
import 'package:get/get.dart';

import '../../domain/contracts/gateways/http_service.dart';
import '../../domain/contracts/gateways/my_logger.dart';
import '../../infrastructure/contracts/gateways/logger_impl.dart';
import '../../infrastructure/provider/datasource.dart';
import '../../infrastructure/provider/remote/datasource_impl.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<HttpService>(DioService());

    Get.put<Datasource>(
      DatasourceImpl(
        httpService: Get.find(),
      ),
    );
    Get.put<MyLogger>(LoggerImpl());
  }
}
