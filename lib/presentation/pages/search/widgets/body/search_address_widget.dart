import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/search_controller.dart';

class SearchAddressWidget extends GetView<SearchController> {
  const SearchAddressWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() =>
        Text(controller.foundAddress.value, style: Get.textTheme.bodyText1));
  }
}
