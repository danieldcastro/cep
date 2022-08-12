import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../global_widgets/global_bottom_menu_widget.dart';
import 'controllers/history_controller.dart';
import 'widgets/history_address_card_widget.dart';
import 'widgets/history_background_widget.dart';
import 'widgets/history_title_widget.dart';

class HistoryPage extends GetView<HistoryController> {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: const GlobalBottomMenuWidget(),
        body: Stack(
          children: [
            const HistoryBackgroundWidget(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HistoryTitleWidget(),
                const SizedBox(height: 25),
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    physics: const BouncingScrollPhysics(),
                    itemCount: 10,
                    itemBuilder: (_, index) {
                      return const HistoryAddressCardWidget();
                    },
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
