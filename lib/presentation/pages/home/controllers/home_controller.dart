import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../core/util/helpers/storage_keys.dart';
import '../../../routes/routes.dart';

class HomeController extends GetxController {
  RxInt searchCounter = 0.obs;

  RxInt savedCounter = 0.obs;

  final GetStorage _getStorageBox = GetStorage();

  goToHistoryPage() {
    Get.offNamed(Routes.HISTORY);
  }

  @override
  void onInit() {
    searchCounter.value = _getStorageBox.read(StorageKeys.CEP_SEARCHED) ?? 0;
    print('searchCounter: ${searchCounter.value}');
    super.onInit();
  }
}
