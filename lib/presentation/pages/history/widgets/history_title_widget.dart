import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../core/util/helpers/icon_paths.dart';

class HistoryTitleWidget extends StatelessWidget {
  const HistoryTitleWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 46.94, left: 30.56),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset(
            IconPaths.STAR,
            color: Get.theme.primaryColor,
            width: 32.88,
          ),
          const SizedBox(height: 14.37),
          Text(
            'Meus favoritos',
            style: Get.textTheme.headlineSmall
                ?.copyWith(color: Get.theme.primaryColor),
          ),
        ],
      ),
    );
  }
}
