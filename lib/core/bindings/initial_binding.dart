import 'package:get/get.dart';

import '../../domain/contracts/gateways/http_service.dart';
import '../../domain/contracts/gateways/my_logger.dart';
import '../../domain/contracts/gateways/sqlite_connection.dart';
import '../../domain/contracts/gateways/sqlite_favorite.dart';
import '../../domain/contracts/repositories/favorite_repository.dart';
import '../../domain/usecases/delete_favorite_by_id/delete_favorite_by_id_usecase.dart';
import '../../domain/usecases/delete_favorite_by_id/delete_favorite_by_id_usecase_impl.dart';
import '../../domain/usecases/find_favorite/find_favorite_usecase.dart';
import '../../domain/usecases/find_favorite/find_favorite_usecase_impl.dart';
import '../../infrastructure/contracts/gateways/dio_service.dart';
import '../../infrastructure/contracts/gateways/logger_impl.dart';
import '../../infrastructure/contracts/gateways/sqlite_connection_impl.dart';
import '../../infrastructure/contracts/gateways/sqlite_favorite_impl.dart';
import '../../infrastructure/contracts/repositories/favorite_repository_impl.dart';
import '../../infrastructure/provider/datasource.dart';
import '../../infrastructure/provider/local_datasource.dart';
import '../../infrastructure/provider/remote/datasource_impl.dart';
import '../../infrastructure/provider/remote/local_datasource_impl.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SqliteConnection>(() => SqliteConnectionImpl.instance);

    Get.put<HttpService>(DioService());

    Get.put<Datasource>(
      DatasourceImpl(
        httpService: Get.find(),
      ),
    );
    Get.put<MyLogger>(LoggerImpl());

    Get.put<SqliteFavorite>(SqliteFavoriteImpl(), permanent: true);

    Get.put<LocalDatasource>(
        LocalDatasourceImpl(sqLiteFavorite: Get.find<SqliteFavorite>()));
    Get.put<FavoriteRepository>(
      FavoriteRepositoryImpl(datasource: Get.find<LocalDatasource>()),
    );
    Get.put<FindFavoriteUsecase>(
      FindFavoriteUsecaseImpl(repository: Get.find<FavoriteRepository>()),
    );
    Get.put<DeleteFavoriteByIdUsecase>(
      DeleteFavoriteByIdUsecaseImpl(repository: Get.find<FavoriteRepository>()),
    );
  }
}
