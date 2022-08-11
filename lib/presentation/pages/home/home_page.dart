import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/util/helpers/image_paths.dart';
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
