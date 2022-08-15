import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../presentation/theme/app_colors.dart';

class GlobalShowSnackbarFunction {
  show(String message, {Color? color}) {
    return Get.snackbar(message, '',
        messageText: Visibility(
          child: Container(),
        ),
        titleText: Text(message,
            style: Get.textTheme.bodyText2!
                .copyWith(color: AppColors().normalWhiteColor)),
        backgroundColor: color?.withOpacity(.87) ??
            AppColors().normalBlackColor.withOpacity(.87),
        colorText: AppColors().normalWhiteColor,
        borderRadius: 20,
        snackPosition: SnackPosition.TOP,
        animationDuration: const Duration(milliseconds: 500),
        barBlur: 0,
        isDismissible: true,
        shouldIconPulse: true,
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 30));
  }
}
