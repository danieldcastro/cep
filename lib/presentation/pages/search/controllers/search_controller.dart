import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchController extends GetxController {
  TextEditingController searchTextFieldController = TextEditingController();

  RxBool isFavoriteButtonPressed = false.obs;

  RxDouble favoriteButtonStarTopPosition = 0.0.obs;

  void onTapFavoriteButton() {
    isFavoriteButtonPressed.value = !isFavoriteButtonPressed.value;
    isFavoriteButtonPressed.value
        ? changeFavoriteButtonStarPositionDown()
        : changeFavoriteButtonStarPositionUp();
  }

  void changeFavoriteButtonStarPositionUp() {
    favoriteButtonStarTopPosition = (-30.0).obs;
  }

  void changeFavoriteButtonStarPositionDown() {
    favoriteButtonStarTopPosition = (30.0).obs;
  }

  @override
  void dispose() {
    super.dispose();
    searchTextFieldController.dispose();
  }
}
