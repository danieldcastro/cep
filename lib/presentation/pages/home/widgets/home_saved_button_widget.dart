import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../core/util/helpers/icon_paths.dart';
import '../../../theme/app_colors.dart';
import '../controllers/home_controller.dart';

class HomeSavedButtonWidget extends GetView<HomeController> {
  const HomeSavedButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 23),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        elevation: 0,
        color: AppColors().extraLightGreyColor,
        child: InkWell(
          borderRadius: BorderRadius.circular(100),
          splashColor: AppColors().lightPurpleColor.withOpacity(.5),
          onTap: () => controller.goToHistoryPage(),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(19.25, 18.5, 16, 18.5),
            child:
                Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
              SvgPicture.asset(IconPaths.BOOKMARK,
                  color: AppColors().lightPurpleColor, width: 20),
              const SizedBox(
                width: 8,
              ),
              Text(
                'CEPs salvos',
                style: Get.textTheme.bodyLarge?.copyWith(
                    color: AppColors().normalPurpleColor,
                    fontWeight: FontWeight.w600),
              ),
              const Spacer(),
              CircleAvatar(
                radius: 12.5,
                backgroundColor: AppColors().normalPurpleColor,
                child: Obx(() => SizedBox(
                      width: 25,
                      height: 25,
                      child: Center(
                        child: AutoSizeText(
                          controller.savedCounter.value.toString(),
                          minFontSize: 8,
                          style: Get.textTheme.titleSmall
                              ?.copyWith(color: AppColors().normalWhiteColor),
                        ),
                      ),
                    )),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
