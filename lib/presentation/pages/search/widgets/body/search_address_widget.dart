import 'package:cep/presentation/pages/search/controllers/search_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
