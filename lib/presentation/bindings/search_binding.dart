import 'package:get/get.dart';

import '../pages/search/controllers/search_controller.dart';

class SearchBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SearchController>(() => SearchController());
  }
}
