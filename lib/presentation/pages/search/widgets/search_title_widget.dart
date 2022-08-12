import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../theme/app_colors.dart';

class SearchTitleWidget extends StatelessWidget {
  const SearchTitleWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text('Procurar CEP',
        style: Get.textTheme.headline5
            ?.copyWith(color: AppColors().normalWhiteColor));
  }
}
