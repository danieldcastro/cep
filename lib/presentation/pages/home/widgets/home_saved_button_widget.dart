import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/util/helpers/icon_paths.dart';
import '../../../theme/app_colors.dart';

class HomeSavedButtonWidget extends StatelessWidget {
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
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.fromLTRB(19.25, 18.5, 16, 18.5),
            child:
                Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
              Image.asset(IconPaths.BOOKMARK,
                  color: AppColors().lightPurpleColor, width: 20),
              const SizedBox(
                width: 8,
              ),
              Text(
                'CEPs salvos',
                style: Get.textTheme.bodyText1?.copyWith(
                    color: AppColors().normalPurpleColor,
                    fontWeight: FontWeight.w600),
              ),
              const Spacer(),
              CircleAvatar(
                radius: 12.5,
                backgroundColor: AppColors().normalPurpleColor,
                child: Text(
                  '3',
                  style: Get.textTheme.subtitle2
                      ?.copyWith(color: AppColors().normalWhiteColor),
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
