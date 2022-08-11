import 'package:auto_size_text/auto_size_text.dart';
import 'package:cep/presentation/pages/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../core/util/helpers/icon_paths.dart';
import '../../../theme/app_colors.dart';

class HomeSearchCounterWidget extends GetView<HomeController> {
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
          padding:
              const EdgeInsets.only(top: 21, bottom: 40, left: 20, right: 20),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: SvgPicture.asset(IconPaths.SIGNPOST,
                      color: AppColors().secondLightPurpleColor, width: 52),
                ),
                Obx(() => Expanded(
                      child: Center(
                        child: AutoSizeText(
                            controller.searchCounter.value.toString(),
                            maxLines: 1,
                            style: Get.textTheme.headline2?.copyWith(
                                color: AppColors().normalWhiteColor)),
                      ),
                    )),
                Text('CEPs pesquisados',
                    style: Get.textTheme.caption
                        ?.copyWith(color: AppColors().normalWhiteColor)),
              ]),
        ),
      ),
    );
  }
}
