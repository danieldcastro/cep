import 'package:flutter/material.dart';

import '../../../theme/app_colors.dart';

class HistoryBackgroundWidget extends StatelessWidget {
  const HistoryBackgroundWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          AppColors().secondLightPurpleColor,
          AppColors().normalWhiteColor,
        ],
      )),
    );
  }
}
