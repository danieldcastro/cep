import 'package:cep/core/util/helpers/icon_paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../routes/routes.dart';
import '../theme/app_colors.dart';

class GlobalBottomMenuWidget extends StatelessWidget {
  const GlobalBottomMenuWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 96,
      child: BottomNavigationBar(
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        backgroundColor: AppColors().normalWhiteColor,
        currentIndex: getCurrentIndex(),
        unselectedItemColor: AppColors().normalGreyColor,
        selectedItemColor: AppColors().primaryColor,
        onTap: changeIndex(),
        unselectedLabelStyle: Get.textTheme.overline,
        selectedLabelStyle: Get.textTheme.overline,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: IconButton(
              onPressed: () async {
                Get.offNamed(Routes.HOME);
              },
              icon: SvgPicture.asset(
                IconPaths.HOME,
                color: getCurrentIndex() == 0
                    ? AppColors().primaryColor
                    : AppColors().normalGreyColor,
              ),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: IconButton(
              onPressed: () async {
                Get.offNamed(Routes.SEARCH);
              },
              icon: SvgPicture.asset(
                IconPaths.SIGNPOST,
                color: getCurrentIndex() == 1
                    ? AppColors().primaryColor
                    : AppColors().normalGreyColor,
              ),
            ),
            label: 'Procurar',
          ),
          BottomNavigationBarItem(
            icon: IconButton(
              onPressed: () async {
                Get.offNamed(Routes.HISTORY);
              },
              icon: SvgPicture.asset(
                IconPaths.STAR,
                color: getCurrentIndex() == 2
                    ? AppColors().primaryColor
                    : AppColors().normalGreyColor,
              ),
            ),
            label: 'Favoritos',
          ),
        ],
      ),
    );
  }
}

int getCurrentIndex() {
  switch (Get.currentRoute) {
    case Routes.HOME:
      return 0;
    case Routes.SEARCH:
      return 1;
    case Routes.HISTORY:
      return 2;
    default:
      return 99;
  }
}

changeIndex() {
  switch (getCurrentIndex()) {
    case 0:
      Get.toNamed(Routes.HOME);
      break;
    case 1:
      Get.toNamed(Routes.SEARCH);
      break;
    case 2:
      Get.toNamed(Routes.HISTORY);
      break;
    default:
  }
}
