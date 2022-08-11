import 'package:get/get.dart';

import '../../../routes/routes.dart';

class HomeController extends GetxController {
  RxInt searchCounter = 0.obs;

  RxInt savedCounter = 0.obs;

  goToHistoryPage() {
    Get.offNamed(Routes.HISTORY);
  }
}
