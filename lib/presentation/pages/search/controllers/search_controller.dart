import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchController extends GetxController {
  TextEditingController searchTextFieldController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    searchTextFieldController.dispose();
  }
}
