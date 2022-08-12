import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../global_widgets/global_bottom_menu_widget.dart';
import 'controllers/search_controller.dart';
import 'widgets/search_subtitle_widget.dart';
import 'widgets/search_textfield_widget.dart';
import 'widgets/search_title_widget.dart';

class SearchPage extends GetView<SearchController> {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: const GlobalBottomMenuWidget(),
        body: Column(
          children: [
            Container(
              height: 232,
              width: context.width,
              color: Get.theme.primaryColor,
              child: Padding(
                  padding: const EdgeInsets.fromLTRB(32, 50, 35, 21),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      SearchTitleWidget(),
                      SearchSubtitleWidget(),
                      SearchTextfieldWidget()
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
