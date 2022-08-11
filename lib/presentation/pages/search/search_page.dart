import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../global_widgets/global_bottom_menu_widget.dart';
import 'controllers/search_controller.dart';

class SearchPage extends GetView<SearchController> {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const GlobalBottomMenuWidget(),
      appBar: AppBar(
        title: const Text('SearchPage'),
      ),
      body: Container(),
    );
  }
}
