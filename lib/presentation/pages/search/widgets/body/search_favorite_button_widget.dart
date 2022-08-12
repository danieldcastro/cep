import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../../core/util/helpers/icon_paths.dart';
import '../../../../theme/app_colors.dart';
import '../../controllers/search_controller.dart';

class SearchFavoriteButtonWidget extends GetView<SearchController> {
  const SearchFavoriteButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Card(
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        elevation: 0,
        color: controller.isFavoriteButtonPressed.value
            ? AppColors().secondNormalWhiteColor
            : AppColors().normalBlueColor,
        child: InkWell(
          borderRadius: BorderRadius.circular(100),
          splashColor: AppColors().lightPurpleColor.withOpacity(.5),
          onTap: () => controller.onTapFavoriteButton(),
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: SizedBox(
                    height: 48,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Stack(
                        clipBehavior: Clip.antiAlias,
                        children: [
                          _buildAnimatedStar(true),
                          _buildAnimatedStar(false)
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Center(
                    child: Obx(() => Padding(
                          padding: const EdgeInsets.only(top: 5.0),
                          child: Text(
                            'Adicionar aos favoritos',
                            style: Get.textTheme.subtitle1?.copyWith(
                                color: controller.isFavoriteButtonPressed.value
                                    ? AppColors().normalPurpleColor
                                    : AppColors().normalWhiteColor,
                                height: 1,
                                fontFamily: 'Hind'),
                          ),
                        )),
                  ),
                ),
                const Spacer()
              ]),
        )));
  }

  AnimatedPositioned _buildAnimatedStar(bool isFilled) {
    return AnimatedPositioned(
      top: isFilled
          ? controller.isFavoriteButtonPressed.value
              ? 13
              : -30
          : controller.isFavoriteButtonPressed.value
              ? 60
              : 13,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      child: SvgPicture.asset(isFilled ? IconPaths.FILLED_STAR : IconPaths.STAR,
          color: isFilled
              ? AppColors().normalYellowColor
              : AppColors().secondLightPurpleColor,
          width: 23),
    );
  }
}
