import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controllers/search_controller.dart';

class SearchPage extends GetView<SearchController> {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SearchPage'),
      ),
      body: Container(),
    );
  }
}
