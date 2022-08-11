import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../global_widgets/global_bottom_menu_widget.dart';
import 'controllers/history_controller.dart';

class HistoryPage extends GetView<HistoryController> {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const GlobalBottomMenuWidget(),
      appBar: AppBar(
        title: const Text('HistoryPage'),
      ),
      body: Container(),
    );
  }
}
