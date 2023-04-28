import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../theme/app_colors.dart';

class SearchAddressTitleWidget extends StatelessWidget {
  const SearchAddressTitleWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'Endereço:',
      style: Get.textTheme.titleMedium
          ?.copyWith(fontSize: 19, color: AppColors().primaryColor),
    );
  }
}
