import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchAddressWidget extends StatelessWidget {
  const SearchAddressWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text('Rua Indaial - até 583 - Itajaí SC - CEP 88303-301',
        style: Get.textTheme.bodyText1);
  }
}
