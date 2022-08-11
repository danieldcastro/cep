import 'package:cep/presentation/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/util/helpers/icon_paths.dart';
import '../../../core/util/helpers/image_paths.dart';
import 'controllers/home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Positioned(
              top: context.height * .08,
              child: SizedBox(
                width: context.width,
                child: Image.asset(
                  ImagePaths.MAN_WITH_BACKPACK,
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 35, left: 32),
                  child: RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        text: 'Olá,\n',
                        style: Get.textTheme.headline5
                            ?.copyWith(fontWeight: FontWeight.w500)),
                    TextSpan(
                        text: 'Bem-vindo',
                        style: Get.textTheme.headline5
                            ?.copyWith(fontWeight: FontWeight.w600))
                  ])),
                ),
                const Spacer(),
                Center(
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
                                  color: AppColors().secondLightPurpleColor,
                                  width: 52),
                            ),
                            Text('525',
                                style: Get.textTheme.headline2?.copyWith(
                                    color: AppColors().normalWhiteColor)),
                            Text('CEPs pesquisados',
                                style: Get.textTheme.caption?.copyWith(
                                    color: AppColors().normalWhiteColor)),
                          ]),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 23),
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100)),
                    elevation: 0,
                    color: AppColors().extraLightGreyColor,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(19.25, 18.5, 16, 18.5),
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
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
                                style: Get.textTheme.subtitle2?.copyWith(
                                    color: AppColors().normalWhiteColor),
                              ),
                            )
                          ]),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
