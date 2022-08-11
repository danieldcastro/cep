import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/util/helpers/icon_paths.dart';
import '../../../theme/app_colors.dart';

class HomeSearchCounterWidget extends StatelessWidget {
  const HomeSearchCounterWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircleAvatar(
        backgroundColor: Get.theme.primaryColor,
        radius: context.width * .27,
        child: Padding(
          padding: const EdgeInsets.only(top: 21, bottom: 40),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Image.asset(IconPaths.SIGNPOST,
                      color: AppColors().secondLightPurpleColor, width: 52),
                ),
                Text('525',
                    style: Get.textTheme.headline2
                        ?.copyWith(color: AppColors().normalWhiteColor)),
                Text('CEPs pesquisados',
                    style: Get.textTheme.caption
                        ?.copyWith(color: AppColors().normalWhiteColor)),
              ]),
        ),
      ),
    );
  }
}
