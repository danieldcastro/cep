import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../core/util/helpers/icon_paths.dart';
import '../../../theme/app_colors.dart';

class HistoryAddressCardWidget extends StatelessWidget {
  const HistoryAddressCardWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: OutlineInputBorder(
          borderSide: BorderSide.none, borderRadius: BorderRadius.circular(16)),
      elevation: 0,
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '13219-070',
                style: Get.textTheme.bodyText1?.copyWith(
                  fontWeight: FontWeight.w500,
                  height: 1.3,
                  color: AppColors().fifthNormalGreyColor,
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: SvgPicture.asset(
                  IconPaths.TRASH,
                  color: Get.theme.primaryColor,
                  width: 19.5,
                  height: 20.5,
                ),
              )
            ],
          ),
          Text(
            'Rua Indaial - até 583 - Itajaí SC - CEP 88303-301',
            style: Get.textTheme.subtitle2?.copyWith(
              height: 1.5,
              color: AppColors().fifthNormalGreyColor,
            ),
          ),
        ]),
      ),
    );
  }
}
