import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../core/util/helpers/image_paths.dart';
import '../../global_widgets/global_bottom_menu_widget.dart';
import 'controllers/home_controller.dart';
import 'widgets/home_saved_button_widget.dart';
import 'widgets/home_search_counter_widget.dart';
import 'widgets/home_title_widget.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: const GlobalBottomMenuWidget(),
        body: Stack(
          children: [
            Positioned(
              top: context.height * .04,
              child: SizedBox(
                width: context.width,
                child: SvgPicture.asset(
                  ImagePaths.MAN_WITH_BACKPACK,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                HomeTitleWidget(),
                Spacer(),
                HomeSearchCounterWidget(),
                HomeSavedButtonWidget(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
