import 'package:get/get.dart';

import '../pages/history/controllers/history_controller.dart';

class HistoryBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HistoryController>(() => HistoryController());
  }
}
